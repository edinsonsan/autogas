part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {
  final Username nombre;
  final Username apellido;
  final Email email;
  final Phone phone;
  final Password password;
  final Confirmpassword confirmPassword;
  final bool isValid;
  final FormStatus formStatus;

  const RegisterState({
    this.nombre = const Username.pure(),
    this.apellido = const Username.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Confirmpassword.pure(''),
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
  });

  RegisterState copyWith({
    Username? nombre,
    Username? apellido,
    Email? email,
    Phone? phone,
    Password? password,
    Confirmpassword? confirmPassword,
    // GlobalKey<FormState>? formKey,
    bool? isValid,
    FormStatus? formStatus,
  }) => RegisterState(
    nombre: nombre ?? this.nombre,
    apellido: apellido ?? this.apellido,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    // formKey: formKey,
    isValid: isValid ?? this.isValid,
    formStatus: formStatus ?? this.formStatus,
  );

  @override
  List<Object> get props => [
    nombre,
    apellido,
    email,
    phone,
    password,
    confirmPassword,
    isValid,
    formStatus,
  ];
}
