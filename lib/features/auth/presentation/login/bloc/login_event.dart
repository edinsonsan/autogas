part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final Email email;
  const EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final Password password;
  const PasswordChanged(this.password);
}

class SaveUserSession extends LoginEvent {
  final AuthResponse authResponse;
  SaveUserSession({ required this.authResponse });
}

class UpdateNotificationToken extends LoginEvent {
  final int id;
  UpdateNotificationToken({required this.id});
}

class FormSubmit extends LoginEvent {}

class ForceValidate extends LoginEvent {}