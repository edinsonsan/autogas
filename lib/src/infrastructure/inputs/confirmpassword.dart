import 'package:formz/formz.dart';

// Define input validation errors
enum ConfirmpasswordError { empty, length, mismatch }

// Extend FormzInput and provide the input type and error type.
class Confirmpassword extends FormzInput<String, ConfirmpasswordError> {
  final String password;
  // Call super.pure to represent an unmodified form input.
  const Confirmpassword.pure(this.password) : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Confirmpassword.dirty({required this.password, String value = ''})
    : super.dirty(value);
  // const Username.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    switch (displayError) {
      case ConfirmpasswordError.empty:
        return 'El campo es requerido';
      case ConfirmpasswordError.length:
        return 'Mínimo 6 caracteres';
      case ConfirmpasswordError.mismatch:
        return 'Las contraseñas no coinciden';
      default:
        return null;
    }
  }

  // Override validator to handle validating a given input value.
  @override
  ConfirmpasswordError? validator(String value) {
    if (value.isEmpty) return ConfirmpasswordError.empty;
    if (value.length < 6) return ConfirmpasswordError.length;
    if (value != password) return ConfirmpasswordError.mismatch;
    return null;
  }
}
