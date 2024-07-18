// ignore_for_file: cascade_invocations

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/cat_detail/data/datasources/cat_detail_datasource.dart';
import '../../features/cat_detail/data/datasources/cat_detail_datasource_impl.dart';
import '../../features/cat_detail/data/repositories/cat_detail_repository_impl.dart';
import '../../features/cat_detail/domain/repositories/cat_detail_repository.dart';
import '../../features/cat_detail/domain/use_cases/fetch_cat_detail.dart';
import '../../features/cat_detail/presentation/bloc/detail_bloc/detail_bloc.dart';
import '../../features/dashboard_home/data/datasources/dashboard_datasource.dart';
import '../../features/dashboard_home/data/datasources/dashboard_datasource_impl.dart';
import '../../features/dashboard_home/data/repositories/dashboard_home_repository_impl.dart';
import '../../features/dashboard_home/domain/repositories/dashboard_home_repository.dart';
import '../../features/dashboard_home/domain/use_cases/get_cats_list_usecase.dart';
import '../../features/dashboard_home/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import '../http/http_service.dart';
import '../network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerLazySingleton<DetailBloc>(
    DetailBloc.new,
  );
  sl.registerLazySingleton<DashboardBloc>(
    DashboardBloc.new,
  );
  //Use Cases
  sl.registerLazySingleton(
    () => FetchCatDetailUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetCatsListUsecase(repository: sl()),
  );
  // Repository
  sl.registerLazySingleton<CatDetailRepository>(
    () => CatDetailRepositoryImpl(
      networkInfo: sl(),
      catDetailDatasource: sl(),
    ),
  );
  sl.registerLazySingleton<DashboardHomeRepository>(
    () => DashboardHomeRepositoryImpl(
      networkInfo: sl(),
      dashboardDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<CatDetailDatasource>(
    () => CatDetailDatasourceImpl(client: sl()),
  );
  sl.registerLazySingleton<DashboardDatasource>(
    () => DashboardDatasourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton(InternetConnectionChecker.new);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(
    HttpService.new,
  );

  sl.registerLazySingleton(Dio.new);
}
