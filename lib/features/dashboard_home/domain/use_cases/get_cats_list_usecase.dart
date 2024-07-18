import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/dashboard_home_repository.dart';

class CreteNewMeasureUseCase {
  CreteNewMeasureUseCase({required this.repository});
  final DashboardHomeRepository repository;

  Future<Either<Failure, dynamic>> call() async => repository.getCatsList();
}
