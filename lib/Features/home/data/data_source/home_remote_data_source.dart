// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Features/home/data/model/book_model/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';

import '../../../../core/utils/function/save_data_box.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewesdBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBook() async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");

    List<BookEntity> books = getBoolList(data);

    saveDataBox(books,kFeaturedBox);

    return books;
  }



  @override
  Future<List<BookEntity>> fetchNewesdBook() async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = getBoolList(data);
    return books;
  }

  List<BookEntity> getBoolList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}


// 
// class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
//   final ApiServices apiServices;
//   HomeRemoteDataSourceImpl(this.apiServices);

//   @override
//   Future<List<BookEntity>> fetchFeaturedBook() async {
//     var data = await apiServices.get(endPoint: "volumes?q=programming");
 // **************** extarct metod to getbookList ******************/// 
//     List<BookEntity> books = [];
//     for (var bookMap in data['items']) {
//       books.add(BookModel.fromJson(bookMap));
//     }

//     return books;
//   }