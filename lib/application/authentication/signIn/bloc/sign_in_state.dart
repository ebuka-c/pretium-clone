part of 'sign_in_bloc.dart';

class SignInState {
  final bool pwdObscure;
  final bool pwdObscure2;
  bool rememberMe;
  bool acceptTC;

  SignInState({
    this.pwdObscure = true,
    this.pwdObscure2 = true,
    this.rememberMe = false,
    this.acceptTC = false,
  });

  SignInState copyWith({bool? pwdObscure, pwdObscure2, rememberMe, acceptTC}) {
    return SignInState(
      pwdObscure: pwdObscure ?? this.pwdObscure,
      pwdObscure2: pwdObscure2 ?? this.pwdObscure2,
      rememberMe: rememberMe ?? this.rememberMe,
      acceptTC: acceptTC ?? this.acceptTC,
    );
  }
}

final class SignInInitial extends SignInState {}
