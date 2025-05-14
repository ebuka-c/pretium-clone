part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool hideBalance;
  final String selectedCountry;

  const HomeState({this.hideBalance = false, this.selectedCountry = 'Nigeria'});

  HomeState copyWith({bool? hideBalance, String? selectedCountry}) {
    return HomeState(
      hideBalance: hideBalance ?? this.hideBalance,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  @override
  List<Object> get props => [hideBalance, selectedCountry];
}

final class HomeInitial extends HomeState {}
