part of 'login_bloc.dart';

enum FormStatus { invalid, valid, validating, posting, success, failure, }

class LoginState extends Equatable {
  final Email email;
  final Password password;
  // final GlobalKey<FormState>? formKey;
  final bool isValid;
  final FormStatus formStatus;
  final Resource? response; 

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    // this.formKey,
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.response
  });

  LoginState copyWith({
    Email? email,
    Password? password,
    GlobalKey<FormState>? formKey,
    bool? isValid,
    FormStatus? formStatus,
    Resource? response,
  }) => LoginState(
    email: email ?? this.email,
    password: password ?? this.password,
    // formKey: formKey,
    isValid: isValid ?? this.isValid,
    formStatus: formStatus ?? this.formStatus,
    response: response,
  );

  @override
  List<Object?> get props => [email, password, isValid, formStatus, response];
}
