import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<TogglePasswordObscureEvent>(_toggleEvent);
    on<ToggleConfirmPasswordObscureEvent>(_onToggleConfirmPwd);
    on<ToggleRememberMeEvent>(_onToggleRememberMeEvent);
    on<ToggleAcceptTCEvent>(_onToggleAcceptTCEvent);
  }

  void _toggleEvent(
    TogglePasswordObscureEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(pwdObscure: !state.pwdObscure));
  }

  void _onToggleConfirmPwd(
    ToggleConfirmPasswordObscureEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(pwdObscure2: !state.pwdObscure2));
  }

  void _onToggleRememberMeEvent(
    ToggleRememberMeEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  void _onToggleAcceptTCEvent(
    ToggleAcceptTCEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(acceptTC: !state.acceptTC));
  }
}
