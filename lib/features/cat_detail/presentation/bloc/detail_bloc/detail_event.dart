part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchCatDetail extends DetailEvent {
  const FetchCatDetail({
    required this.catId,
  });

  final String catId;
}
