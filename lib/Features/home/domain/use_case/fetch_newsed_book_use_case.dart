import 'package:bookly/core/use_case/use-case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/filure_class.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, NoParameter> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParameter? param]) async {
    return await homeRepo.fetchFeaturedBook();
  }
}
