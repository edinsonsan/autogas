part of 'forgot_bloc.dart';

enum FormStatus { invalid, valid, validating, posting, success, failure, }

class ForgotState extends Equatable {
  final Email email;
  final bool isValid;
  final FormStatus formStatus;
  final Resource? response; 

  const ForgotState({
    this.email = const Email.pure(),
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.response
  });

  ForgotState copyWith({
    Email? email,
    bool? isValid,
    FormStatus? formStatus,
    Resource? response,
  }) => ForgotState(
    email: email ?? this.email,
    isValid: isValid ?? this.isValid,
    formStatus: formStatus ?? this.formStatus,
    response: response,
  );

  @override
  List<Object?> get props => [email, isValid, formStatus, response];
}
