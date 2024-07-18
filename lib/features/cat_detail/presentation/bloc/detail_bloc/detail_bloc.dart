import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<FetchCatDetail>((FetchCatDetail event, Emitter<DetailState> emit) {
      // TODO: implement event handler
    });
  }
}
