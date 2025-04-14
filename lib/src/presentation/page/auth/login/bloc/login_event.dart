part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class LoginInitEvent extends LoginEvent{}

class EmailChanged extends LoginEvent{
  final String email;
  const EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent{
  final String password;
  const PasswordChanged(this.password);
}

class FormSubmit extends LoginEvent{}