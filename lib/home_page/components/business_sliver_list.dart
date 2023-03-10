// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';

class BusinessSliverList extends StatelessWidget {
  const BusinessSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        switch (state.status) {
          case HomePageStatus.initial:
            return const SliverToBoxAdapter(child: SizedBox());

          case HomePageStatus.loading:
            return const SliverToBoxAdapter(
              child: CircularProgressIndicator.adaptive(),
            );

          case HomePageStatus.loaded:
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final business = state.filteredBusinesses.elementAt(index);

                  return ListTile(
                    title: Text(business.name),
                    subtitle: const Text('Description would go here'),
                  );
                },
                childCount: state.filteredBusinesses.length,
              ),
            );

          case HomePageStatus.failed:
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Sorry, we ran into an error fetching this data.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => context
                          .read<HomePageBloc>()
                          .add(FetchEvent(near: state.coordinate!)),
                      child: const Text('Try Again'),
                    )
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
