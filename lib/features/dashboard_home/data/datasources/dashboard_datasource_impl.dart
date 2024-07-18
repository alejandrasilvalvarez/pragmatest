import 'package:dio/dio.dart';

import '../../../../core/http/http_service.dart';
import 'dashboard_datasource.dart';

class DashboardDatasourceImpl implements DashboardDatasource {
  DashboardDatasourceImpl({required this.client});
  final HttpService client;

  @override
  Future<Response> getCatsList() {
    // TODO: implement getCatsList
    throw UnimplementedError();
  }
}
