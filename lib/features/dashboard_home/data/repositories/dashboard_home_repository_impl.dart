import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/dashboard_home_repository.dart';
import '../datasources/dashboard_datasource.dart';

class DashboardHomeRepositoryImpl implements DashboardHomeRepository {
  DashboardHomeRepositoryImpl({
    required this.networkInfo,
    required this.dashboardDataSource,
  });
  final DashboardDatasource dashboardDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, dynamic>> getCatsList() {
    // TODO: implement getCatsList
    throw UnimplementedError();
  }
}
