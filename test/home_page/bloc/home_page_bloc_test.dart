// Dart imports:
import 'dart:io';

// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_test_task/main.dart';
import 'package:flutter_test_task/model/coordinates.dart';
import '../../test_constants.dart';

void main() {
  final mockDio = MockDio();

  setUp(() {
    getIt.registerSingleton<Dio>(mockDio);
  });

  tearDown(() async {
    reset(mockDio);
    await getIt.reset();
  });

  group('HomePageBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => HomePageBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [LoadingState, FailedState] when Dio throws',
      setUp: () => when(() => mockDio.get(any()))
          .thenThrow(const HttpException('HttpException')),
      build: () => HomePageBloc(),
      act: (bloc) => bloc.add(FetchEvent(near: Coordinate.newYork)),
      expect: () => const [
        LoadingState(coordinate: Coordinate.newYork),
        FailedState(coordinate: Coordinate.newYork)
      ],
    );

    blocTest(
      'emits [LoadingState, FailedState] when Response.statusCode != 200',
      setUp: () => when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: mockData,
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.unauthorized,
        ),
      ),
      build: () => HomePageBloc(),
      act: (bloc) => bloc.add(FetchEvent(near: Coordinate.newYork)),
      expect: () => const [
        LoadingState(coordinate: Coordinate.newYork),
        FailedState(coordinate: Coordinate.newYork)
      ],
    );

    blocTest(
      'emits [LoadingState, LoadedState] on receiving successful response',
      setUp: () {
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: mockData,
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.ok,
          ),
        );
      },
      build: () => HomePageBloc(),
      act: (bloc) => bloc.add(FetchEvent(near: Coordinate.newYork)),
      expect: () => [
        const LoadingState(coordinate: Coordinate.newYork),
        successfulLoadedState,
      ],
    );

    blocTest(
      'emits [LoadingState, LoadedState], and properly computes filteredBusinesses',
      setUp: () {
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: mockData,
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.ok,
          ),
        );
      },
      build: () => HomePageBloc(),
      act: (bloc) => bloc
        ..add(FetchEvent(near: Coordinate.newYork))
        ..add(FilterEvent(selectedCategoryType: 'Bodywork')),
      expect: () => [
        const LoadingState(coordinate: Coordinate.newYork),
        successfulLoadedState,
        successfulFilteredState,
      ],
    );
  });
}
