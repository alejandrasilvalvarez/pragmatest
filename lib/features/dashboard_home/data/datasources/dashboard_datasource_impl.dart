import 'package:dio/dio.dart';

import '../../../../core/environment/environment.dart';
import '../../../../core/http/http_service.dart';
import 'dashboard_datasource.dart';

class DashboardDatasourceImpl implements DashboardDatasource {
  DashboardDatasourceImpl({required this.client});
  final HttpService client;

  @override
  Future<Response<dynamic>> getCatsList() async{
   dynamic response = await client.request(
      '${Environment.authBaseUrl}${Environment.catsListUrl}',
    );

    return response;
  }
}
