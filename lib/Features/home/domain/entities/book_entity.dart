import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final num? pageCount;
  @HiveField(4)
  final String? publishedDate;
  @HiveField(5)
  final String? bookId;
  @HiveField(6)
  final String? category;

  BookEntity(
      {this.bookId,
      this.image,
      this.title,
      this.authorName,
      this.pageCount,
      this.publishedDate,
      this.category});
}
