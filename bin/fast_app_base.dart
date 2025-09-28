import 'package:args/args.dart';
import 'package:fast_app_base/src/template_creator.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()..addFlag('help', abbr: 'h', negatable: false, help: 'Shows usage information.');
  final argResults = parser.parse(arguments);

  if (argResults['help'] as bool || argResults.rest.isEmpty) {
    print('Usage: fast_app_base <project_name>');
    return;
  }

  final projectName = argResults.rest.first;
  print('Creating a new project named "$projectName"...');

  final creator = TemplateCreator(projectName);
  await creator.create();

  print('Project "$projectName" created successfully!');
}
