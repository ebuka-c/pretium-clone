part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class TogglePasswordObscureEvent extends SignInEvent {}

class ToggleConfirmPasswordObscureEvent extends SignInEvent {}
