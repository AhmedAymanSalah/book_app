 import 'package:bookly/Features/home/domain/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/filure_class.dart';

abstract class HomeRepo{
  Future <Either<Filure,List<BookEntity>>> fetchFeaturedBook();
  Future <Either<Filure,List<BookEntity>>> fetchNewesdBook();
}