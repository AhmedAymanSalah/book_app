import 'package:bookly/Features/home/domain/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewesdBook();
}


class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBook() {
    // TODO: implement fetchFeaturedBook
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewesdBook() {
    // TODO: implement fetchNewesdBook
    throw UnimplementedError();
  }

}