// Package imports:
import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final String id;
  final ServiceCategoryAttributes attributes;

  const ServiceCategory({required this.id, required this.attributes});

  factory ServiceCategory.fromJson(dynamic json) {
    final attributes = ServiceCategoryAttributes.fromJson(json['attributes']);

    return ServiceCategory(id: json['id'], attributes: attributes);
  }

  @override
  List<Object?> get props => [id, attributes];
}

class ServiceCategoryAttributes extends Equatable {
  final String name;
  final String categoryType;

  const ServiceCategoryAttributes({
    required this.name,
    required this.categoryType,
  });

  factory ServiceCategoryAttributes.fromJson(dynamic json) {
    return ServiceCategoryAttributes(
      name: json['name'],
      categoryType: json['category_type'],
    );
  }

  @override
  List<Object?> get props => [name, categoryType];
}
