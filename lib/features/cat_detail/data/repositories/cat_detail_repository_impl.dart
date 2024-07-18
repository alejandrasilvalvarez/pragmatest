import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/cat_detail_repository.dart';
import '../datasources/cat_detail_datasource.dart';

class CatDetailRepositoryImpl implements CatDetailRepository {
  CatDetailRepositoryImpl({
    required this.networkInfo,
    required this.catDetailDatasource,
  });
  final CatDetailDatasource catDetailDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, dynamic>> getCatsDetail({
    required String catId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response<dynamic> response =
            await catDetailDatasource.fetchCatsDetail(catId);
        if (response.statusCode == 200) {
          return Right<Failure, dynamic>(response.data);
        } else {
          return Left<Failure, dynamic>(
            ServerFailure(
              response.data.toString(),
            ),
          );
        }
      } on DioException catch (e) {
        return Left<Failure, dynamic>(
          ServerFailure(
            e.response?.data['message'] ?? '',
          ),
        );
      } catch (e) {
        return Left<Failure, dynamic>(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    } else {
      return const Left<Failure, String>(NetworkFailure());
    }
  }
}
