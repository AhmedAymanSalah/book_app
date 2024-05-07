import 'package:bookly/Features/home/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/filure_class.dart';
import '../../../../core/use_case/use-case.dart';
import '../book_entity.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, NoParameter> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Filure, List<BookEntity>>> call([NoParameter? param]) async{
    return await homeRepo.fetchFeaturedBook();
  }
}



