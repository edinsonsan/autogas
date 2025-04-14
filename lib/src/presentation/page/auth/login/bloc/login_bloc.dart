import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  LoginBloc() : super(const LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, formKey: formKey));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.password, formKey: formKey));
  }

  void _onFormSubmit(FormSubmit event, Emitter<LoginState> emit) {
    print('Email: ${state.email}');
    print('Passwod: ${state.password}');
  }
}
