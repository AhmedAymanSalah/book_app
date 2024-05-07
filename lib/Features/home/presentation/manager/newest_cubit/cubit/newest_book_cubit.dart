import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_case/fetch_newsed_book_use_case.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewestdBooksUseCase) : super(NewestBookInitial());
  final  FetchNewestdBooksUseCase   fetchNewestdBooksUseCase  ;
  Future<void> fetchFeaturedBook() async {
    emit(NewestBookLoading());
    var result = await fetchNewestdBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBookFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
