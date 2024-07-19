import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/util/injection_container.dart';
import '../../../data/models/cat_model.dart';
import '../../../domain/use_cases/get_cats_list_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<FetchCatsList>(
        (FetchCatsList event, Emitter<DashboardState> emit) async {
      emit(const DashboardStateLoading());
      GetCatsListUsecase usecase = sl<GetCatsListUsecase>();
      await usecase().then((dynamic value) {
        value.fold(
          (Failure l) => emit(
            DashboardStateError(
              errorMessage: l.errorMessage,
            ),
          ),
          (List<CatModel> r) {
            emit(
              DashboardStateSuccessful(
                catsListTotal: r,
                catsListToShow: r,
              ),
            );
          },
        );
      });
    });
    on<FilterCatsList>(
        (FilterCatsList event, Emitter<DashboardState> emit) async {
      emit(const DashboardStateLoading());
      List<CatModel> filteredList = <CatModel>[];
      if (event.nameToFilter.isNotEmpty) {
        filteredList = event.catsListTotal
            .where(
              (CatModel eachCat) => (eachCat.name ?? '').toLowerCase().contains(
                    event.nameToFilter.toLowerCase(),
                  ),
            )
            .toList();
      } else if (event.nameToFilter.isEmpty) {
        filteredList = event.catsListTotal;
      }
      emit(
        DashboardStateSuccessful(
          catsListTotal: event.catsListTotal,
          catsListToShow: filteredList,
        ),
      );
    });
  }
}
