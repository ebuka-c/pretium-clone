import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      on<ToggleBalanceHideEvent>(_toggleBalanceHideEvent);
      on<SelectCountryEvent>(_selectCountryEvent);
    });
  }

  void _toggleBalanceHideEvent(
    ToggleBalanceHideEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(hideBalance: !state.hideBalance));
  }

  void _selectCountryEvent(SelectCountryEvent event, Emitter<HomeState> emit) {
    // update state with new country
    emit(state.copyWith(selectedCountry: event.country));
  }
}
