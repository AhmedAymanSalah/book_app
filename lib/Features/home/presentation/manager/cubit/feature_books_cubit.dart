import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_case/fetch_feature_book_use_case.dart';
import 'package:flutter/material.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.fetchFeaturedBookUseCase)
      : super(FeatureBooksInitial());

  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;
  Future<void> fetchFeaturedBook() async {
    emit(FeatureBooksLoading());
    var result = await fetchFeaturedBookUseCase.call();
    result.fold((failure) {
      emit(FeatureBooksFailure(failure.message));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
