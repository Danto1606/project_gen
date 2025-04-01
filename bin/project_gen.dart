import 'package:args/args.dart';
import 'package:project_gen/create.dart';
import 'package:project_gen/feature.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addCommand(
      'project',
    )
    ..addCommand(
      'feature',
    )
    ..addOption(
      'title',
      abbr: 't',
    )
    ..addOption('org');

  try {
    final result = parser.parse(arguments);
    print(arguments);

    if (result.command == null) {
      print('invalid command');
      print(parser.usage);
      return;
    }
    final command = result.command!.name;

    if (command == 'project') {
      final String name =
          result.options.contains('title') ? result['title'] : 'new_project';
      final String org =
          result.options.contains('org') ? result['org'] : ' com.example';
      final test = org.split('.');
      if (test.length != 2) {
        print("invalid org name");
        return;
      }
      return create(name, org);
    }
    if (command == 'feature') {
      final String? name =
          result.options.contains('title') ? result['title'] : null;
      print(result['title']);

      if (name == null) {
        print('feature name required');
        return;
      }
      return feature(name);
    }
  } catch (e) {
    print('Error: $e');
    print(parser.usage);
  }
}
