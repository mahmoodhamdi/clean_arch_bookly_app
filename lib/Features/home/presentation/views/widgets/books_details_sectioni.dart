import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
            image: book.image ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.authorName ?? 'Unknown Author',
            style: Styles.textStyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "Category: ${book.category??"UnCategorized"}",
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "Published Date: ${book.publishedDate!}",
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 16,
        ),
        const BooksAction(),
      ],
    );
  }
}
