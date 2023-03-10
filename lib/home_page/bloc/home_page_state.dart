part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, loaded, failed }

@immutable
abstract class HomePageState extends Equatable {
  final HomePageStatus status;

  final Coordinate? coordinate;

  final Set<Business> businesses;
  final Set<Business> filteredBusinesses;

  final String? selectedCategoryType;
  final Set<String> categoryTypes;
  final Set<ServiceCategory> categories;

  const HomePageState({
    required this.status,
    required this.coordinate,
    required this.businesses,
    required this.filteredBusinesses,
    required this.selectedCategoryType,
    required this.categoryTypes,
    required this.categories,
  });

  const HomePageState.empty({required this.status, this.coordinate})
      : businesses = const {},
        filteredBusinesses = const {},
        selectedCategoryType = null,
        categoryTypes = const {},
        categories = const {};

  @override
  List<Object?> get props => [
        status,
        coordinate,
        businesses,
        filteredBusinesses,
        selectedCategoryType,
        categoryTypes,
        categories,
      ];
}

class InitialState extends HomePageState {
  const InitialState() : super.empty(status: HomePageStatus.initial);
}

class LoadingState extends HomePageState {
  const LoadingState({required super.coordinate})
      : super.empty(status: HomePageStatus.loading);
}

class LoadedState extends HomePageState {
  const LoadedState({
    required super.coordinate,
    required super.businesses,
    required super.filteredBusinesses,
    required super.selectedCategoryType,
    required super.categoryTypes,
    required super.categories,
  }) : super(status: HomePageStatus.loaded);
}

class FailedState extends HomePageState {
  const FailedState({required super.coordinate})
      : super.empty(status: HomePageStatus.failed);
}
