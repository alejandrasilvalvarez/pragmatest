// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class DashboardHomeRepository {
  Future<Either<Failure, dynamic>> getCatsList();
}
