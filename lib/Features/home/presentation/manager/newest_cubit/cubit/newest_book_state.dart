part of 'newest_book_cubit.dart';

@immutable
abstract class NewestBookState {}

class NewestBookInitial extends NewestBookState {}

class NewestBookLoading extends NewestBookState {}

class NewestBookFailure extends NewestBookState {
  final String errormessage;

  NewestBookFailure(this.errormessage);
}

class NewestBooksSuccess extends NewestBookState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
