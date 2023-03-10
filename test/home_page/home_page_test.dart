// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:flutter_test_task/home_page/components/category_dropdown_menu.dart';
import 'package:flutter_test_task/home_page/components/location_dropdown_menu.dart';
import 'package:flutter_test_task/main.dart';
import '../test_constants.dart';

void main() {
  final mockDio = MockDio();

  setUp(() {
    getIt.registerSingleton<Dio>(mockDio);
  });

  tearDown(() async {
    reset(mockDio);
    await getIt.reset();
  });

  testWidgets('Flow test', (t) async {
    when(() => mockDio.get(any())).thenAnswer(
      (_) async => Response(
        data: mockJson,
        requestOptions: RequestOptions(),
        statusCode: HttpStatus.ok,
      ),
    );

    await t.pumpWidget(const MyApp());

    var dropdown = find.byType(LocationDropdownMenu);
    await t.tap(dropdown);
    await t.pumpAndSettle();

    var dropdownItem = find.text('Charleston').last;
    await t.tap(dropdownItem);
    await t.pumpAndSettle();

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Test Business 1'), findsOneWidget);
    expect(find.text('Test Business 2'), findsOneWidget);

    dropdown = find.byType(CategoryDropdownMenu);
    await t.tap(dropdown);
    await t.pumpAndSettle();

    dropdownItem = find.text('Bodywork').last;
    await t.tap(dropdownItem);
    await t.pumpAndSettle();

    expect(find.text('Bodywork'), findsOneWidget);
    expect(find.text('Test Business 1'), findsOneWidget);
    expect(find.text('Test Business 2'), findsNothing);

    when(() => mockDio.get(any()))
        .thenThrow(const HttpException('HttpException'));

    dropdown = find.byType(LocationDropdownMenu);
    await t.tap(dropdown);
    await t.pumpAndSettle();

    dropdownItem = find.text('New York').last;
    await t.tap(dropdownItem);
    await t.pumpAndSettle();

    expect(find.byType(OutlinedButton), findsOneWidget);
  });
}
