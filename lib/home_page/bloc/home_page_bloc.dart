// Dart imports:
import 'dart:io';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:flutter_test_task/model/business.dart';
import 'package:flutter_test_task/model/coordinates.dart';
import 'package:flutter_test_task/model/service_category.dart';
import '../../main.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Dio _httpClient = getIt<Dio>();

  HomePageBloc() : super(const InitialState()) {
    on<FetchEvent>(_handleFetchEvent);
    on<FilterEvent>(_handleFilterEvent);
  }

  Future<void> _handleFetchEvent(event, emit) async {
    if (state is LoadingState) {
      return;
    }

    emit(LoadingState(coordinate: event.coordinate));

    Response response;
    try {
      response = await _httpClient.get(
        '/businesses'
        '?limit=100&offset=0&includes=service_categories'
        '&filters=latitude==${event.coordinate.latitude},'
        'longitude==${event.coordinate.longitude}',
      );
    } catch (_) {
      emit(FailedState(coordinate: event.coordinate));
      return;
    }

    if (response.statusCode != HttpStatus.ok) {
      emit(FailedState(coordinate: event.coordinate));
      return;
    }

    _parseSuccessfulResponse(event, emit, response);
  }

  void _parseSuccessfulResponse(
    FetchEvent event,
    Emitter<HomePageState> emit,
    Response<dynamic> response,
  ) {
    final categoryList = response.data['included'] as List;
    final categories = categoryList.map(ServiceCategory.fromJson).toSet();

    final categoryTypes =
        categories.map((c) => c.attributes.categoryType).toSortedSet();

    final businessList = response.data['data'] as List;
    final businesses = businessList.map(Business.fromJson).toSortedSet();

    emit(
      LoadedState(
        coordinate: event.coordinate,
        businesses: businesses,
        filteredBusinesses: businesses,
        selectedCategoryType: null,
        categoryTypes: categoryTypes,
        categories: categories,
      ),
    );
  }

  void _handleFilterEvent(event, emit) {
    final filteredBusinesses = _getFilteredBusinesses(
      selectedCategoryType: event.selectedCategoryType,
      categories: state.categories,
      businesses: state.businesses,
    );

    emit(
      LoadedState(
        coordinate: state.coordinate,
        businesses: state.businesses,
        filteredBusinesses: filteredBusinesses,
        selectedCategoryType: event.selectedCategoryType,
        categoryTypes: state.categoryTypes,
        categories: state.categories,
      ),
    );
  }

  Set<Business> _getFilteredBusinesses({
    required String selectedCategoryType,
    required Set<ServiceCategory> categories,
    required Set<Business> businesses,
  }) {
    final filteredCategories = categories
        .where((c) => c.attributes.categoryType == selectedCategoryType);

    final filteredBusinesses = {
      for (final category in filteredCategories)
        ...businesses.where((b) => b.categoryIds.contains(category.id))
    };

    return filteredBusinesses.toSortedSet();
  }
}

extension Sorting<T extends Comparable> on Iterable<T> {
  Set<T> toSortedSet() {
    final list = toList();
    list.sort((a, b) => a.compareTo(b));
    return list.toSet();
  }
}
