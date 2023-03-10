// Package imports:
import 'package:equatable/equatable.dart';

class Business extends Equatable implements Comparable {
  final String id;
  final String name;

  final Set<String> categoryIds;

  const Business({
    required this.id,
    required this.name,
    required this.categoryIds,
  });

  factory Business.fromJson(dynamic json) {
    final categoryList =
        json['relationships']['service_categories']['data'] as List;
    final categoryIds = categoryList.map((c) => c['id'] as String).toSet();

    return Business(
      id: json['id'],
      name: json['attributes']['business_name'],
      categoryIds: categoryIds,
    );
  }

  @override
  int compareTo(other) {
    return name.compareTo(other.name);
  }

  @override
  List<Object?> get props => [id, name, categoryIds];
}
