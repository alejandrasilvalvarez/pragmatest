part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => <Object>[];
}

final class DashboardInitial extends DashboardState {}

class DashboardStateError extends DashboardState {
  const DashboardStateError({required this.errorMessage});
  final String errorMessage;
}

class DashboardStateSuccessful extends DashboardState {
  const DashboardStateSuccessful({
    required this.catsListTotal,
    required this.catsListToShow,
  });
  final List<CatModel> catsListTotal;
  final List<CatModel> catsListToShow;
}

class DashboardStateLoading extends DashboardState {
  const DashboardStateLoading();
}
