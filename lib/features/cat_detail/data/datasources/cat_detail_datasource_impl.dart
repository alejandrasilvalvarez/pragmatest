

import 'package:dio/dio.dart';

import '../../../../core/http/http_service.dart';
import 'cat_detail_datasource.dart';

class CatDetailDatasourceImpl implements CatDetailDatasource {
  CatDetailDatasourceImpl({required this.client});
  final HttpService client;

  @override
  Future<Response> fetchCatsDetail(String catId) {
    // TODO: implement fetchCatsDetail
    throw UnimplementedError();
  }
}
