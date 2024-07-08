import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/fetch_similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    context
        .read<SimilarBooksCubit>()
        .fetchSimilarBooks(category: book.category ?? book.bookId.toString());
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          book: book,
        ),
      ),
    );
  }
}
