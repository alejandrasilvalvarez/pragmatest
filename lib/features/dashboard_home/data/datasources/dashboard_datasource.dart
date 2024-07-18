// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';

abstract class DashboardDatasource {
  Future<Response<dynamic>> getCatsList();
}
