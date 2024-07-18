import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// [mode] can be
  /// [GTW_PROD, GTW_PT, GTW_QA, INTERNAL_PROD, INTERNAL_QA, INTERNAL_PT]
  static String mode = 'GTW_QA';

  static String get env => dotenv.env['ENVIRONMENT']!;

  // BASE URL
  static String get authBaseUrl => dotenv.env['BASE_URL']!;

  // CATS LIST
  static String get catsListUrl => dotenv.env['CATS_LIST']!;

}
