part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchCatsList extends DashboardEvent {
  const FetchCatsList();
}

class FilterCatsList extends DashboardEvent {
  const FilterCatsList({
    required this.catsListTotal,
    required this.nameToFilter,
  });
  final List<CatModel> catsListTotal;
  final String nameToFilter;
}
