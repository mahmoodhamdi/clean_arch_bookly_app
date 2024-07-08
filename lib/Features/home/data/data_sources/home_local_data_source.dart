import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(featuredBooksBox);
    List<BookEntity> books = box.values.toList();
    if (books.isEmpty) {
      return [];
    }

    return books;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(newestBooksBox);
    List<BookEntity> books = box.values.toList();
    if (books.isEmpty) {
      return [];
    }

    return books;
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    var box = Hive.box<BookEntity>(similarBooksBox);
    List<BookEntity> books = box.values.toList();
    if (books.isEmpty) {
      return [];
    }

    return books;
  }
}
