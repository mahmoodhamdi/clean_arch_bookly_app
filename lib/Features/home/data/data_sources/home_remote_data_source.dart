import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/cache_books_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response =
        await _apiServices.get("?q=programming&key=$apiKey=free-ebooks");
    List<BookEntity> books = getBooksList(response);
    await cacheBooksData(books, featuredBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await _apiServices
        .get("?q=programming&orderBy=newest&key=$apiKey=free-ebooks");
    List<BookEntity> books = getBooksList(response);
    await cacheBooksData(books, newestBooksBox);
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