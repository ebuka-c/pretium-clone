part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class ToggleBalanceHideEvent extends HomeEvent {}

class SelectCountryEvent extends HomeEvent {
  final String country;
  const SelectCountryEvent(this.country);
}
