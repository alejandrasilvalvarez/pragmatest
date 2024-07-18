// ignore_for_file: one_member_abstracts



import 'package:dio/dio.dart';

abstract class CatDetailDatasource {
  Future<Response<dynamic>> fetchCatsDetail(
    String catId,
  );
}
