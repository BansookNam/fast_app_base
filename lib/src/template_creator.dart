import 'dart:io';
import 'package:path/path.dart' as p;

class TemplateCreator {
  final String projectName;
  late final Directory _projectDir;
  late final Directory _templateDir;

  TemplateCreator(this.projectName) {
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
  }

  Future<void> _copyTemplate() async {
    final entities = await _templateDir.list(recursive: false).toList();
    final ignoreList = [
      '.git',
      '.dart_tool',
      '.idea',
      'build',
      'pubspec.lock',
      'bin',
      'LICENSE',
      'README.md',
      'my_new_app'
    ];

    for (final entity in entities) {
      if (ignoreList.contains(p.basename(entity.path))) {
        continue;
      }
      final newPath = p.join(_projectDir.path, p.basename(entity.path));
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

    await for (final entity in source.list(recursive: false)) {
      final newPath = p.join(destination.path, p.basename(entity.path));
      if (entity is File) {
        await entity.copy(newPath);
      } else if (entity is Directory) {
        await _copyDirectory(entity, Directory(newPath), visited: visited);
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
      RegExp(r'(?ms)^\s*executables:\s*\n(?:[ \t]+.*\n?)*'),
      '',
    );

    content = content.replaceAll(
      RegExp(r'(?m)^\s*(homepage|repository):[^\n]*\n?'),
      '',
    );

    content = content.replaceAll('https://github.com/BansookNam/fast_app_base', '');

    content = content.replaceAll(RegExp(r'\n\n+'), '\n\n');

    await pubspecFile.writeAsString(content);
  }
}
