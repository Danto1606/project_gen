import 'dart:io';

Future<void> create(String title, String org) async {
  final command = 'flutter';
  final args = [
    'create',
    '--empty',
    '--org',
    org,
    '--platform',
    'android',
    '--platform',
    'ios',
    title,
  ];

  await Process.run(command, args);

  print('application creted');
  print('creating directories');

  final dir = Directory.current.path;
  final toCreate = Directory('$dir/$title/lib/features');
  if (!toCreate.existsSync()) await toCreate.create(recursive: true);

  final files = [
    '/core/data_state/data_state.dart',
    '/core/network/api_client.dart',
    '/core/utils/dimensions.dart',
    '/core/utils/extentions.dart',
    '/core/routes/routes.dart',
    '/core/routes/pages.dart',
    '/core/themes/theme.dart',
    '/core/themes/colors.dart',
  ];

  for (final file in files) {
    final raw = File('$dir/$title/lib$file');
    if (raw.existsSync()) continue;
    raw.create(recursive: true);
  }

  print('files creted');

  Process.run(command, ['pub', 'add', 'go_router']);

  Process.run(command, ['pub', 'add', 'bloc']);

  Process.run(command, ['pub', 'add', 'http']);

  
}
