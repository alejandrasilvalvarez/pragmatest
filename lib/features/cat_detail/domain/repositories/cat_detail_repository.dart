// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class CatDetailRepository {
  Future<Either<Failure, dynamic>> getCatsDetail({
    required String catId,
  });
}
