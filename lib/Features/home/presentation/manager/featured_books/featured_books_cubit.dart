import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({
    int startIndex = 0,
  }) async {
    if (startIndex == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(startIndex);
    result.fold(
      (failure) => (startIndex == 0)
          ? {emit(FeaturedBooksFailure(failure.errorMessage))}
          : {emit(FeaturedBooksPaginationFailure(failure.errorMessage))},
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
