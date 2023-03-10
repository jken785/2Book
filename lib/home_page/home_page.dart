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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business collection'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            minimum: const EdgeInsets.all(8),
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
          const BusinessSliverList(),
        ],
      ),
    );
  }
}
