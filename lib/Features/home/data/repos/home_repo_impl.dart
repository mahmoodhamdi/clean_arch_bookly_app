import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int startIndex = 0}) async {
    List<BookEntity> booksList = [];
    try {
      booksList =
          homeLocalDataSource.fetchFeaturedBooks(startIndex: startIndex);
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks(
          startIndex: startIndex 
      )
      ;
      return Right(booksList);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> booksList = [];
    try {
      // booksList = homeLocalDataSource.fetchNewestBooks();
      // if (booksList.isNotEmpty) {
      //   return Right(booksList);
      // }
      booksList = await homeRemoteDataSource.fetchNewestBooks();
      return Right(booksList);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category}) async {
    List<BookEntity> booksList = [];
    try {
      // booksList = homeLocalDataSource.fetchSimilarBooks();
      // if (booksList.isNotEmpty) {
      //   return Right(booksList);
      // }
      booksList =
          await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return Right(booksList);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
