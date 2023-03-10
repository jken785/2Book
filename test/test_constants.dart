// Package imports:
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_test_task/model/business.dart';
import 'package:flutter_test_task/model/coordinates.dart';
import 'package:flutter_test_task/model/service_category.dart';

class MockDio extends Mock implements Dio {}

const mockData = {
  "included": [
    {
      "id": "1",
      "attributes": {
        "name": "Service 1",
        "category_type": "Bodywork",
      },
    },
    {
      "id": "2",
      "attributes": {
        "name": "Service 2",
        "category_type": "Spa",
      },
    },
    {
      "id": "3",
      "attributes": {
        "name": "Service 3",
        "category_type": "Chiropractic",
      },
    }
  ],
  "data": [
    {
      "id": "123",
      "attributes": {
        "business_name": "Test Business 1",
        "description": "test",
      },
      "relationships": {
        "service_categories": {
          "data": [
            {"id": "1", "type": "service-categories"},
            {"id": "2", "type": "service-categories"},
            {"id": "3", "type": "service-categories"}
          ]
        },
      },
    },
    {
      "id": "234",
      "attributes": {
        "business_name": "Test Business 2",
        "description": "test",
      },
      "relationships": {
        "service_categories": {
          "data": [
            {"id": "2", "type": "service-categories"},
            {"id": "3", "type": "service-categories"}
          ]
        },
      },
    }
  ]
};

final successfulLoadedState = LoadedState(
  businesses: {
    const Business("123", 'Test Business 1', 'test', ['1', '2', '3']),
    const Business("234", 'Test Business 2', 'test', ['2', '3'])
  },
  coordinate: Coordinate.newYork,
  filteredBusinesses: {
    const Business("123", 'Test Business 1', 'test', ['1', '2', '3']),
    const Business("234", 'Test Business 2', 'test', ['2', '3'])
  },
  selectedCategoryType: null,
  categoryTypes: const {'Bodywork', 'Chiropractic', 'Spa'},
  categories: {
    const ServiceCategory(
      '1',
      ServiceCategoryAttributes('Service 1', 'Bodywork'),
    ),
    const ServiceCategory(
      '2',
      ServiceCategoryAttributes('Service 2', 'Spa'),
    ),
    const ServiceCategory(
      '3',
      ServiceCategoryAttributes('Service 3', 'Chiropractic'),
    )
  },
);

final successfulFilteredState = LoadedState(
  businesses: {
    const Business("123", 'Test Business 1', 'test', ['1', '2', '3']),
    const Business("234", 'Test Business 2', 'test', ['2', '3'])
  },
  coordinate: Coordinate.newYork,
  filteredBusinesses: {
    const Business("123", 'Test Business 1', 'test', ['1', '2', '3']),
  },
  selectedCategoryType: 'Bodywork',
  categoryTypes: const {'Bodywork', 'Chiropractic', 'Spa'},
  categories: {
    const ServiceCategory(
      '1',
      ServiceCategoryAttributes('Service 1', 'Bodywork'),
    ),
    const ServiceCategory(
      '2',
      ServiceCategoryAttributes('Service 2', 'Spa'),
    ),
    const ServiceCategory(
      '3',
      ServiceCategoryAttributes('Service 3', 'Chiropractic'),
    )
  },
);
