part of 'feature_books_cubit.dart';

@immutable
abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksError extends FeatureBooksState {
  final String errormessage;

  FeatureBooksError(this.errormessage);
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntity> books;

  FeatureBooksSuccess(this.books);
}
