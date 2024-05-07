
import '../../domain/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewesdBook();
}


class HomeLocalDataSourceImple extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook() {
    // TODO: implement fetchFeaturedBook
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewesdBook() {
    // TODO: implement fetchNewesdBook
    throw UnimplementedError();
  }
}