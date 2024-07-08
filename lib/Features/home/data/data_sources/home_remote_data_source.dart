import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/cache_books_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int startIndex = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int startIndex = 0}) async {
    var response = await _apiServices
        .get("?q=random&key=$apiKey&startIndex=${startIndex * 10}");
    List<BookEntity> books = getBooksList(response);
    await cacheBooksData(books, featuredBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await _apiServices
        .get("?q=random&key=$apiKey&orderBy=newest&startIndex=0");
    List<BookEntity> books = getBooksList(response);
    await cacheBooksData(books, newestBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var response =
        await _apiServices.get("?q=$category&key=$apiKey&orderBy=relevance");
    List<BookEntity> books = getBooksList(response);
    await cacheBooksData(books, similarBooksBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> response) {
    List<BookEntity> books = [];
    for (var book in response['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
