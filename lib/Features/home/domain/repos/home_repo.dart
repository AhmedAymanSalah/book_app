import 'package:dartz/dartz.dart';

import '../../../../core/error/filure_class.dart';
import '../entities/book_entity.dart';


abstract class HomeRepo{
  Future <Either<Filure,List<BookEntity>>> fetchFeaturedBook();
  Future <Either<Filure,List<BookEntity>>> fetchNewesdBook();
}