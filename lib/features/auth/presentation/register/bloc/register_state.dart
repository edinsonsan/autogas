part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting, success, failure, }

class RegisterState extends Equatable {
  final Username name;
  final Username lastname;
  final Email email;
  final Phone phone;
  final Password password;
  final Confirmpassword confirmPassword;
  final bool isValid;
  final FormStatus formStatus;
  final Resource? response;

  const RegisterState({
    this.name = const Username.pure(),
    this.lastname = const Username.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    Confirmpassword? confirmPassword,
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.response
  }) : confirmPassword = confirmPassword ?? const Confirmpassword.pure('');

  toUser() => User(
    name: name.value, 
    lastname: lastname.value, 
    email: email.value, 
    phone: phone.value, 
    password: password.value
  );

  RegisterState copyWith({
    Username? name,
    Username? lastname,
    Email? email,
    Phone? phone,
    Password? password,
    Confirmpassword? confirmPassword,
    // GlobalKey<FormState>? formKey,
    bool? isValid,
    FormStatus? formStatus,
    Resource? response,
  }) {
    final updatePassword = password ?? this.password;

    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: updatePassword,
      confirmPassword:
          confirmPassword ??
          Confirmpassword.dirty(
            password: updatePassword.value,
            value: this.confirmPassword.value,
          ),
      // formKey: formKey,
      isValid: isValid ?? this.isValid,
      formStatus: formStatus ?? this.formStatus,
      response: response,
    );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword,
    isValid,
    formStatus,
    response
  ];
}
