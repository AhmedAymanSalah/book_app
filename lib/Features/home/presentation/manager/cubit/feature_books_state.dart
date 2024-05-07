part of 'feature_books_cubit.dart';

@immutable
abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksFailure extends FeatureBooksState {
  final String errormessage;

  FeatureBooksFailure(this.errormessage);
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntity> books;

  FeatureBooksSuccess(this.books);
}
