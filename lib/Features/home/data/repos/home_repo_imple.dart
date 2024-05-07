// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/core/error/filure_class.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImple extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImple({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBook();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBook();
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewesdBook() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewesdBook();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewesdBook();
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
