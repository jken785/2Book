part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class FetchEvent extends HomePageEvent {
  final Coordinate coordinate;

  FetchEvent({required Coordinate near}) : coordinate = near;
}

class FilterEvent extends HomePageEvent {
  final String selectedCategoryType;

  FilterEvent({required this.selectedCategoryType});
}
