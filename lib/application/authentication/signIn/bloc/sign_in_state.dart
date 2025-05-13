part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final bool pwdObscure;
  final bool pwdObscure2;

  const SignInState({this.pwdObscure = true, this.pwdObscure2 = true});

  SignInState copyWith({bool? pwdObscure, pwdObscure2}) {
    return SignInState(
      pwdObscure: pwdObscure ?? this.pwdObscure,
      pwdObscure2: pwdObscure2 ?? this.pwdObscure2,
    );
  }
}

final class SignInInitial extends SignInState {}
