import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/cat_detail_repository.dart';

class FetchCatDetailUseCase {
  FetchCatDetailUseCase({required this.repository});
  final CatDetailRepository repository;

  Future<Either<Failure, dynamic>> call({
    required String catId,
  }) async =>
      repository.getCatsDetail(
        catId: catId,
      );
}
