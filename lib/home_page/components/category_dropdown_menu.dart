// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';

class CategoryDropdownMenu extends StatelessWidget {
  const CategoryDropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listenWhen: (previous, current) =>
          current.status == HomePageStatus.loaded,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case HomePageStatus.loaded:
            return DropdownButton<String>(
              value: state.selectedCategoryType,
              isExpanded: true,
              hint: const Text('All'),
              items: [
                for (final categoryType in state.categoryTypes)
                  DropdownMenuItem(
                    value: categoryType,
                    child: Text(categoryType),
                  )
              ],
              onChanged: (newCategoryType) {
                if (newCategoryType == null) {
                  return;
                }

                context
                    .read<HomePageBloc>()
                    .add(FilterEvent(selectedCategoryType: newCategoryType));
              },
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
