import 'dart:io';
import 'package:path/path.dart' as p;

class TemplateCreator {
  final String projectName;
  final Set<String> platforms;
  late final Directory _projectDir;
  late final Directory _templateDir;

  TemplateCreator(this.projectName, this.platforms) {
    _projectDir = Directory(p.join(Directory.current.path, projectName));
    _templateDir = _findTemplateDirectory();
  }

  Directory _findTemplateDirectory() {
    var path = p.dirname(Platform.script.toFilePath());
    while (path != p.dirname(path)) {
      final pubspecFile = File(p.join(path, 'pubspec.yaml'));
      if (pubspecFile.existsSync()) {
        final content = pubspecFile.readAsStringSync();
        if (content.contains('name: fast_app_base')) {
          return Directory(path);
        }
      }
      path = p.dirname(path);
    }
    throw Exception('Failed to find project root');
  }

  Future<void> create() async {
    if (await _projectDir.exists()) {
      print('Error: Directory "${_projectDir.path}" already exists.');
      exit(1);
    }

    print('Creating project directory at "${_projectDir.path}"');
    await _projectDir.create(recursive: true);

    print('Copying template files from "${_templateDir.path}"');
    await _copyTemplate();

    print('Updating project name...');
    await _updatePubspec();

    print('Rewriting package imports...');
    await _rewritePackageReferences();
  }

  Future<void> _copyTemplate() async {
    final entities = await _templateDir.list(recursive: false).toList();
    // Only copy the items needed for the application scaffold
    final allowList = <String>{
      'lib',
      'assets',
      'analysis_options.yaml',
      'pubspec.yaml',
      'flutter_native_splash.yaml',
    };

    if (platforms.contains('android')) {
      allowList.add('android');
    }
    if (platforms.contains('ios')) {
      allowList.add('ios');
    }
    if (platforms.contains('macos')) {
      allowList.add('macos');
    }
    if (platforms.contains('web')) {
      allowList.add('web');
    }

    for (final entity in entities) {
      final base = p.basename(entity.path);
      if (!allowList.contains(base)) {
        continue;
      }
      final newPath = p.join(_projectDir.path, base);
      if (entity is File) {
        await entity.copy(newPath);
      } else if (entity is Directory) {
        await _copyDirectory(entity, Directory(newPath));
      }
    }
  }

  Future<void> _copyDirectory(
    Directory source,
    Directory destination, {
    Set<String>? visited,
  }) async {
    visited ??= <String>{};
    final sourcePath = source.resolveSymbolicLinksSync();
    if (visited.contains(sourcePath)) {
      return;
    }
    visited.add(sourcePath);

    await destination.create(recursive: true);

    // Directories to ignore at any depth
    const nestedIgnore = {
      '.git',
      '.dart_tool',
      'build',
      '.idea',
      '.gradle',
      'ios',
      'macos',
      'android',
      'windows',
      'linux',
      'DerivedData',
    };

    await for (final entity
        in source.list(recursive: false, followLinks: false)) {
      try {
        final base = p.basename(entity.path);
        // Skip symlinks entirely
        final type = FileSystemEntity.typeSync(entity.path, followLinks: false);
        if (type == FileSystemEntityType.link) {
          continue;
        }
        // Skip ignored directories/files at any depth
        if (nestedIgnore.contains(base)) {
          continue;
        }

        final newPath = p.join(destination.path, base);
        if (entity is File) {
          await entity.copy(newPath);
        } else if (entity is Directory) {
          await _copyDirectory(entity, Directory(newPath), visited: visited);
        }
      } catch (_) {
        // Ignore items that cannot be read/copied
        continue;
      }
    }
  }

  Future<void> _updatePubspec() async {
    final pubspecFile = File(p.join(_projectDir.path, 'pubspec.yaml'));
    if (!await pubspecFile.exists()) {
      return;
    }

    String content = await pubspecFile.readAsString();

    content = content.replaceFirst(
      RegExp(r'^name: .*$', multiLine: true),
      'name: $projectName',
    );

    content = content.replaceAll(
      RegExp(r'^\s*executables:\s*\n(?:[ \t]+.*\n?)*',
          multiLine: true, dotAll: true),
      '',
    );

    content = content.replaceAll(
      RegExp(r'^\s*(homepage|repository):[^\n]*\n?', multiLine: true),
      '',
    );

    content =
        content.replaceAll('https://github.com/BansookNam/fast_app_base', '');

    // Remove command-line dependencies and their comment from dependencies
    content = content.replaceAll(
      RegExp(r'^\s*#\s*command-line[^\n]*\n?', multiLine: true),
      '',
    );
    content = content.replaceAll(
      RegExp(r'^\s{2}args:\s*[^\n]*\n?', multiLine: true),
      '',
    );
    content = content.replaceAll(
      RegExp(r'^\s{2}path:\s*[^\n]*\n?', multiLine: true),
      '',
    );

    // Ensure flutter assets block exists (always enforce desired block)
    const assetsBlock = '  uses-material-design: true\n'
        '  assets:\n'
        '    - assets/json/\n'
        '    - assets/image/\n'
        '    - assets/image/icon/\n'
        '    - assets/image/flag/\n'
        '    - assets/image/darkmode/\n'
        '    - assets/translations/\n'
        '    - assets/\n';

    final flutterSectionRegex =
        RegExp(r'^flutter:\s*\n(?:^[ \t].*\n?)*', multiLine: true);
    if (flutterSectionRegex.hasMatch(content)) {
      content = content.replaceFirst(
        flutterSectionRegex,
        'flutter:\n\n$assetsBlock',
      );
    } else {
      content = content.trimRight() + '\n\nflutter:\n\n' + assetsBlock;
    }

    content = content.replaceAll(RegExp(r'\n\n+'), '\n\n');

    await pubspecFile.writeAsString(content);
  }

  Future<void> _rewritePackageReferences() async {
    final exts = {'.dart', '.yaml', '.yml'};
    await for (final entity
        in _projectDir.list(recursive: true, followLinks: false)) {
      if (entity is! File) continue;
      final ext = p.extension(entity.path).toLowerCase();
      if (!exts.contains(ext)) continue;
      try {
        var content = await entity.readAsString();
        final updated = content
            .replaceAll('package:fast_app_base/', 'package:$projectName/')
            .replaceAll("package:fast_app_base'", "package:$projectName'");
        if (!identical(content, updated) && content != updated) {
          await entity.writeAsString(updated);
        }
      } catch (_) {
        continue;
      }
    }
  }
}
