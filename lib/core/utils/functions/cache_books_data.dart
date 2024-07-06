import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

Future<void> cacheBooksData(List<BookEntity> books, String boxName) async {
  Hive.box(boxName);
  await Hive.box(featuredBooksBox).addAll(books);
}
