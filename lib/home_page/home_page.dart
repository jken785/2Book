// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'components/business_sliver_list.dart';
import 'components/category_dropdown_menu.dart';
import 'components/location_dropdown_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const minSafeArea = EdgeInsets.all(8.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business collection'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            minimum: minSafeArea,
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Expanded(child: LocationDropdownMenu()),
                      SizedBox(width: 8),
                      Expanded(child: CategoryDropdownMenu()),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          const SliverSafeArea(
            minimum: minSafeArea,
            sliver: BusinessSliverList(),
          ),
        ],
      ),
    );
  }
}
