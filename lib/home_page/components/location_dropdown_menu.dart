// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';
import '../../model/coordinates.dart';

class LocationDropdownMenu extends StatefulWidget {
  const LocationDropdownMenu({super.key});

  @override
  State<LocationDropdownMenu> createState() => _LocationDropdownMenuState();
}

class _LocationDropdownMenuState extends State<LocationDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return DropdownButton<Coordinate>(
          value: state.coordinate,
          isExpanded: true,
          hint: const Text('City'),
          items: const [
            DropdownMenuItem(
              value: Coordinate.charleston,
              child: Text('Charleston'),
            ),
            DropdownMenuItem(
              value: Coordinate.newYork,
              child: Text('New York'),
            ),
            DropdownMenuItem(
              value: Coordinate.washington,
              child: Text('Washington'),
            ),
          ],
          // TODO: improve bloc so there's no need to disable the DropdownButton while loading
          onChanged: state.status == HomePageStatus.loading
              ? null
              : (newCoordinate) {
                  if (newCoordinate == null) {
                    return;
                  }

                  context
                      .read<HomePageBloc>()
                      .add(FetchEvent(near: newCoordinate));
                },
        );
      },
    );
  }
}
