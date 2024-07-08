part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class FetchSimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;
  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;
  SimilarBooksFailure(this.errorMessage);
}
