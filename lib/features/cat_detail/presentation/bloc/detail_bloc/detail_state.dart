part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => <Object>[];
}

final class DetailInitial extends DetailState {}

class DetailStateError extends DetailState {
  const DetailStateError({required this.errorMessage});
  final String errorMessage;
}

class DetailStateSuccessfull extends DetailState {
  const DetailStateSuccessfull({
    required this.info,
  });
  final dynamic info;
}

class DetailStateLoading extends DetailState {
  const DetailStateLoading();
}
