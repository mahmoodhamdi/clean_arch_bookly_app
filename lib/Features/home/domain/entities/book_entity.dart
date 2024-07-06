class BookEntity {
  final String? image;
  final String? title;
  final String? authorName;
  final num? pageCount;
  final String? publishedDate;
  final String? bookId;

  BookEntity(
      {this.bookId,
      this.image,
      this.title,
      this.authorName,
      this.pageCount,
      this.publishedDate});
}
