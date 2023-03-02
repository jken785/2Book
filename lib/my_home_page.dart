import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coordinates.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio _httpClient = Dio(
    BaseOptions(baseUrl: 'https://www.massagebook.com/nxt/pu-api/v1/'),
  );

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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<Coordinates>(
                          isExpanded: true,
                          hint: const Text('City'),
                          items: const [
                            DropdownMenuItem(
                              value: Coordinates.charleston,
                              child: Text('Charleston'),
                            ),
                            DropdownMenuItem(
                              value: Coordinates.charleston,
                              child: Text('New York'),
                            ),
                            DropdownMenuItem(
                              value: Coordinates.washington,
                              child: Text('Washington'),
                            ),
                          ],
                          onChanged: (_) {

                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text('Category filter'),
                          items: [],
                          onChanged: (_) {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchBusinesses() async {
    final result = await _httpClient.get('/businesses');
  }
}
