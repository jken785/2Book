// Package imports:
import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final String id;
  final ServiceCategoryAttributes attributes;

  const ServiceCategory(this.id, this.attributes);

  factory ServiceCategory.fromJson(dynamic json) {
    final attributes = ServiceCategoryAttributes.fromJson(json['attributes']);

    return ServiceCategory(json['id'], attributes);
  }

  @override
  List<Object?> get props => [id, attributes];
}

class ServiceCategoryAttributes extends Equatable {
  final String name;
  final String categoryType;

  const ServiceCategoryAttributes(this.name, this.categoryType);

  factory ServiceCategoryAttributes.fromJson(dynamic json) {
    return ServiceCategoryAttributes(json['name'], json['category_type']);
  }

  @override
  List<Object?> get props => [name, categoryType];
}
