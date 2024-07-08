import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/use_cases/use_case.dart';
import 'package:bookly/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  // ...

  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String params) async {
    return await homeRepo.fetchSimilarBooks(category: params);
  }
}
