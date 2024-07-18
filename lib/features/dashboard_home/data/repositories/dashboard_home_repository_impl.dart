// ignore_for_file: prefer_foreach

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/dashboard_home_repository.dart';
import '../datasources/dashboard_datasource.dart';
import '../models/cat_model.dart';

class DashboardHomeRepositoryImpl implements DashboardHomeRepository {
  DashboardHomeRepositoryImpl({
    required this.networkInfo,
    required this.dashboardDataSource,
  });
  final DashboardDatasource dashboardDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, dynamic>> getCatsList() async {
    if (await networkInfo.isConnected) {
      try {
        Response<dynamic> responseList =
            await dashboardDataSource.getCatsList();
        if (responseList.statusCode == 200) {
          List<CatModel> cats = <CatModel>[];
          List<dynamic> catsDynamic = responseList.data
              .map(
                (dynamic eachCat) => CatModel.fromMap(
                  eachCat as Map<String, dynamic>,
                ),
              )
              .toList();
          for (dynamic element in catsDynamic) {
            cats.add(element as CatModel);
          }
          return Right<Failure, List<CatModel>>(cats);
        } else {
          return Left<Failure, String>(
            ServerFailure(
              responseList.data.toString(),
            ),
          );
        }
      } on DioException catch (e) {
        return Left<Failure, String>(
          ServerFailure(
            e.response?.data['message'] ?? '',
          ),
        );
      } catch (e) {
        return Left<Failure, String>(
          ServerFailure(e.toString()),
        );
      }
    } else {
      return const Left<Failure, String>(NetworkFailure());
    }
  }
}
