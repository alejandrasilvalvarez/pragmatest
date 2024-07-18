// ignore_for_file: avoid_print, always_specify_types, unnecessary_final, cascade_invocations, lines_longer_than_80_chars

import 'dart:io';

void main() {
  // Preguntar al usuario por el nombre de la nueva feature
  print('Ingrese el nombre de la nueva feature:');
  final newFeatureName = stdin.readLineSync();

  if (newFeatureName == null || newFeatureName.isEmpty) {
    print('El nombre de la nueva feature no puede estar vacío.');
    return;
  }

  // Convertir el nombre de la feature a minúsculas y sin underscores
  final formattedFeatureName = newFeatureName.replaceAll('_', '').toLowerCase();
  final featureNameWithUnderscores =
      newFeatureName.replaceAll(' ', '_').toLowerCase();
  final featureNameCapitalized = newFeatureName
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join('');

  final baseDir = Directory('lib/features/$newFeatureName');

  // Define main directories and their respective subdirectories
  final structure = {
    'domain': ['repositories', 'entities', 'use_cases'],
    'data': ['datasources', 'repositories', 'models'],
    'presentation': ['bloc', 'pages', 'widgets'],
  };

  try {
    // Create the base directory if it doesn't exist
    if (!baseDir.existsSync()) {
      baseDir.createSync(recursive: true);
      print('Created base directory: ${baseDir.path}');
    }

    // Create each main directory and its subdirectories
    structure.forEach((mainDir, subDirs) {
      final mainDirPath = Directory('${baseDir.path}/$mainDir');
      if (!mainDirPath.existsSync()) {
        mainDirPath.createSync();
        print('Created main directory: ${mainDirPath.path}');
      }

      for (var subDir in subDirs) {
        final subDirPath = Directory('${mainDirPath.path}/$subDir');
        if (!subDirPath.existsSync()) {
          subDirPath.createSync();
          print('Created subdirectory: ${subDirPath.path}');

          // Create specific files in pages and widgets directories
          if (subDir == 'pages') {
            final filePath = File('${subDirPath.path}/pages.dart');
            filePath.createSync();
            filePath.writeAsStringSync(
              'library com.pragmatest.app.$formattedFeatureName.presentation.pages;\n',
            );
            print('Created file with content: ${filePath.path}');
          } else if (subDir == 'widgets') {
            final filePath = File('${subDirPath.path}/widgets.dart');
            filePath.createSync();
            filePath.writeAsStringSync(
              'library com.pragmatest.app.$formattedFeatureName.presentation.widgets;\n',
            );
            print('Created file: ${filePath.path}');
          }

          // Create the <nombre del feature>_repository.dart file in domain/repositories
          if (mainDir == 'domain' && subDir == 'repositories') {
            final repositoryFilePath = File(
              '${subDirPath.path}/${featureNameWithUnderscores}_repository.dart',
            );
            repositoryFilePath.createSync();
            repositoryFilePath.writeAsStringSync(
              'abstract class ${featureNameCapitalized}Repository {\n}\n',
            );
            print(
              'Created repository file with content: ${repositoryFilePath.path}',
            );
          }
          if (mainDir == 'data' && subDir == 'repositories') {
            final repositoryFilePath = File(
              '${subDirPath.path}/${featureNameWithUnderscores}_repository_impl.dart',
            );
            repositoryFilePath.createSync();
            repositoryFilePath.writeAsStringSync(
              'abstract class ${featureNameCapitalized}RepositoryImpl {\n}\n',
            );
            print(
              'Created repository file with content: ${repositoryFilePath.path}',
            );
          }
        }
      }
    });
  } catch (e) {
    print('Error creating directories or files: $e');
  }
  const filePath = 'lib/core/util/injection_container.dart';

  try {
    // Leer el archivo
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    // Encontrar la línea con el comentario // Repositories
    final index = lines.indexWhere((line) => line.contains('// Repositories'));

    if (index == -1) {
      print('No se encontró el comentario "// Repositories" en el archivo.');
      return;
    }

    // Crear la línea que se va a insertar
    final newLine = '''
    sl.registerLazySingleton<${featureNameCapitalized}Repository>(
      () => ${featureNameCapitalized}RepositoryImpl(sl()),
    );
    ''';

    // Insertar la línea después del comentario
    lines.insert(index + 1, newLine);

    // Escribir de nuevo el archivo con la nueva línea
    file.writeAsStringSync(lines.join('\n'));

    print('Línea añadida correctamente en el archivo $filePath');
  } catch (e) {
    print('Error al modificar el archivo: $e');
  }
}
