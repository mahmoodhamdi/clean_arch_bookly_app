import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/fetch_similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_details_sectioni.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  book: book,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
                  builder: (context, state) {
                    if (state is SimilarBooksFailure) {
                      return Text(state.errorMessage);
                    }
                    if (state is SimilarBooksSuccess) {
                      return SimilarBooksSection(
                        books: state.books,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
