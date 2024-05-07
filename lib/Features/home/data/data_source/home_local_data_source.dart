import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewesdBook();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook() {
    var box = Hive.box<BookEntity>(kNewesdBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewesdBook() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }
}
