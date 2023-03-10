// Package imports:
import 'package:equatable/equatable.dart';

class Business extends Equatable implements Comparable {
  final String id;
  final String name;
  final String description;

  final List<String> categoryIds;

  const Business(this.id, this.name, this.description, this.categoryIds);

  factory Business.fromJson(dynamic json) {
    final categoryList =
        json['relationships']['service_categories']['data'] as List;
    final categoryIds = categoryList.map((c) => c['id'] as String).toList();

    return Business(
      json['id'],
      json['attributes']['business_name'],
      json['attributes']['description'],
      categoryIds,
    );
  }

  @override
  int compareTo(other) {
    return name.compareTo(other.name);
  }

  @override
  List<Object?> get props => [id, name, description];
}
