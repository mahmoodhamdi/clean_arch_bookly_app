import 'package:bookly/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(books: state.books);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
