import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PageCount extends StatelessWidget {
  const PageCount({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.pageCount,
  });

  final num? pageCount;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$pageCount",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            pageCount == 1 ? 'Page' : 'Pages',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
