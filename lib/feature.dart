import 'dart:io';

Future<void> feature(
  String title,
) async {
  final dir = Directory.current.path;
  final pub = File('$dir/pubspec.yaml');
  if (!pub.existsSync()) {
    print("Not a dart/flutter project");
  }
  final paths = [
    '/data/data_sources',
    '/data/model',
    '/data/repositories',
    '/domain/entities',
    '/domain/repositories',
    '/domain/usecases',
    '/presentation/bloc',
    '/presentation/pages',
    '/presentation/widgets',
  ];

  for (final path in paths) {
    final raw = Directory('$dir/lib/features/$title$path');
    if (raw.existsSync()) continue;
    raw.create(recursive: true);
  }

  print('folders creted');
}
