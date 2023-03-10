// Package imports:
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_test_task/model/business.dart';
import 'package:flutter_test_task/model/coordinates.dart';
import 'package:flutter_test_task/model/service_category.dart';

class MockDio extends Mock implements Dio {}

const mockJson = {
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
  businesses: {business1, business2},
  coordinate: Coordinate.newYork,
  filteredBusinesses: {business1, business2},
  selectedCategoryType: null,
  categoryTypes: categoryTypes,
  categories: categories,
);

final successfulFilteredState = LoadedState(
  businesses: {business1, business2},
  coordinate: Coordinate.newYork,
  filteredBusinesses: {business1},
  selectedCategoryType: 'Bodywork',
  categoryTypes: categoryTypes,
  categories: categories,
);

const business1 = Business(
  id: "123",
  name: 'Test Business 1',
  categoryIds: {'1', '2', '3'},
);
const business2 = Business(
  id: "234",
  name: 'Test Business 2',
  categoryIds: {'2', '3'},
);

final categoryTypes = {'Bodywork', 'Chiropractic', 'Spa'};
final categories = {
  const ServiceCategory(
    id: '1',
    attributes:
        ServiceCategoryAttributes(name: 'Service 1', categoryType: 'Bodywork'),
  ),
  const ServiceCategory(
    id: '2',
    attributes:
        ServiceCategoryAttributes(name: 'Service 2', categoryType: 'Spa'),
  ),
  const ServiceCategory(
    id: '3',
    attributes: ServiceCategoryAttributes(
      name: 'Service 3',
      categoryType: 'Chiropractic',
    ),
  )
};
