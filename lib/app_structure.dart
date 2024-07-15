import 'dart:io';

import 'package:flutter/foundation.dart';

void listFiles(Directory dir, {String prefix = ''}) async {
  try {
    final List<FileSystemEntity> entities = dir.listSync().toList();
    for (int i = 0; i < entities.length; i++) {
      final FileSystemEntity entity = entities[i];
      final bool isLast = i == entities.length - 1;

      // Extract just the last part of the path
      final String name = entity.path.split(Platform.pathSeparator).last;
      final String icon = entity is Directory ? '📁' : '📄';
      final String newPrefix = isLast ? '└── $icon ' : '├── $icon ';

      if (entity is File) {
        if (kDebugMode) {
          print('$prefix$newPrefix$name');
        }
      } else if (entity is Directory) {
        if (kDebugMode) {
          print('$prefix$newPrefix$name');
        }
        // Recursively list the contents of the directory
        // Adjust the prefix to visually connect the tree lines
        // Increase the space for each level of indentation
        listFiles(entity,
            prefix: prefix +
                (isLast ? '        ' : '|       ')); // Increased spaces
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error reading directory $dir: $e');
    }
  }
}

void main() {
  // Use the project's lib directory as the root directory
  Directory current = Directory.current;
  Directory libDir = Directory('${current.path}/lib');
  if (libDir.existsSync()) {
    if (kDebugMode) {
      print('Listing files in lib directory: ${libDir.path}');
    }
    listFiles(libDir);
  } else {
    if (kDebugMode) {
      print(
          'The lib directory does not exist in the current project structure.');
    }
  }
}
//dart run app_structure.dart
