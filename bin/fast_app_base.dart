import 'package:args/args.dart';
import 'package:fast_app_base/src/template_creator.dart';

import 'dart:io';
import 'dart:isolate';

const String kVersion = '0.0.1+9';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Shows usage information.')
    ..addFlag('version',
        abbr: 'v', negatable: false, help: 'Shows the package version.');
  final argResults = parser.parse(arguments);

  if (argResults['version'] as bool) {
    print(await _resolveVersion());
    return;
  }

  Future<Set<String>> _selectPlatforms() async {
    final options = <String>[
      'Mobile only (Android + iOS)',
      'Desktop only (macOS)',
      'Desktop and web (macOS + Web)',
      'All Platforms (Android + iOS + macOS + Web)',
      'Quit',
    ];

    stdout.writeln('Select target platforms:');
    for (var i = 0; i < options.length; i++) {
      stdout.writeln('  ${i + 1}. ${options[i]}');
    }

    while (true) {
      stdout.write('Enter a number (1-5) then press Enter: ');
      final input = stdin.readLineSync();
      final choice = int.tryParse((input ?? '').trim());
      switch (choice) {
        case 1:
          return {'android', 'ios'};
        case 2:
          return {'macos'};
        case 3:
          return {'macos', 'web'};
        case 4:
          return {'android', 'ios', 'macos', 'web'};
        case 5:
          stdout.writeln('Cancelled.');
          exit(0);
        default:
          stdout.writeln('Invalid selection. Please enter 1, 2, 3, 4, or 5.');
      }
    }
  }

  if (argResults['help'] as bool || argResults.rest.isEmpty) {
    print('Usage: fast_app_base <project_name>');
    return;
  }

  final projectName = argResults.rest.first;
  final namePattern = RegExp(r'^[a-z0-9_]+$');
  if (!namePattern.hasMatch(projectName)) {
    print(
        'Error: Project name must be snake_case (lowercase letters, numbers, and underscores only).\n'
        'Examples: my_app, my_app2');
    exit(64);
  }
  final platforms = await _selectPlatforms();
  print('Creating a new project named "$projectName"...');

  final creator = TemplateCreator(projectName, platforms);
  await creator.create();

  print('Project "$projectName" created successfully!');
}

Future<String> _resolveVersion() async {
  return kVersion;
  // try {
  //   // Resolve a concrete file within the package to ensure resolution works in global activation.
  //   final uri = await Isolate.resolvePackageUri(
  //       Uri.parse('package:fast_app_base/src/template_creator.dart'));
  //   if (uri == null) {
  //     return kVersion;
  //   }
  //   final libFile = File.fromUri(uri);
  //   final libDir = libFile.parent; // .../lib/src
  //   final rootDir = libDir.parent.parent; // package root
  //   final pubspec = File('${rootDir.path}/pubspec.yaml');
  //   if (!await pubspec.exists()) {
  //     return kVersion;
  //   }
  //   final content = await pubspec.readAsString();
  //   final match =
  //       RegExp(r'^version:\s*([^\s#]+)', multiLine: true).firstMatch(content);
  //   if (match == null) {
  //     print('uri is null 3');
  //     return kVersion;
  //   }
  //   return match.group(1)!;
  // } catch (_) {
  //   print('uri is null 4');
  //   return kVersion;
  // }
}
