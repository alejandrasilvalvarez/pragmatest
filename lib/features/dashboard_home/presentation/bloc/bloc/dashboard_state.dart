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
    required this.info,
  });
  final List<CatModel> info;
}

class DashboardStateLoading extends DashboardState {
  const DashboardStateLoading();
}
