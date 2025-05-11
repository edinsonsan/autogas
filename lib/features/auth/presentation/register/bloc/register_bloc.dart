import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUsescases authUsescases;
  RegisterBloc(this.authUsescases) : super(const RegisterState()) {
    on<NameChanged>(_onNameChanged);
    on<LastnameChanged>(_onLastnameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);

    on<FormSubmit>(_onFormSubmit);
    on<FormReset>(_onFormReset);
    on<ForceValidate>(_onForceValidate);
  }

  void _onNameChanged(NameChanged event, Emitter<RegisterState> emit) {
    final name = event.name;
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([
          name,
          state.lastname,
          state.email,
          state.phone,
          state.password,
          state.confirmPassword,
        ]),
        // formKey: formKey
      ),
    );
  }

  void _onLastnameChanged(LastnameChanged event, Emitter<RegisterState> emit) {
    final lastname = event.lastname;
    emit(
      state.copyWith(
        lastname: lastname,
        isValid: Formz.validate([
          state.name,
          lastname,
          state.email,
          state.phone,
          state.password,
          state.confirmPassword,
        ]),
        // formKey: formKey
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.name,
          state.lastname,
          email,
          state.phone,
          state.password,
          state.confirmPassword,
        ]),
        // formKey: formKey
      ),
    );
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<RegisterState> emit) {
    final phone = event.phone;
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([
          state.name,
          state.lastname,
          state.email,
          phone,
          state.password,
          state.confirmPassword,
        ]),
        // formKey: formKey
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    final password = event.password;
    final confirmPassword = Confirmpassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.name,
          state.lastname,
          state.email,
          state.phone,
          password,
          confirmPassword,
        ]),
        // formKey: formKey,
      ),
    );
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final confirmPassword = Confirmpassword.dirty(
      password: state.password.value,
      value: event.confirmPassword.value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([
          state.name,
          state.lastname,
          state.email,
          state.phone,
          state.password,
          confirmPassword,
        ]),
        // formKey: formKey,
      ),
    );
  }

  void _onFormSubmit(FormSubmit event, Emitter<RegisterState> emit) async {
  // Marcamos los campos como "dirty" para que se actualice su validación
  final name = Username.dirty(value: state.name.value);
  final lastname = Username.dirty(value: state.lastname.value);
  final email = Email.dirty(value: state.email.value);
  final phone = Phone.dirty(value: state.phone.value);
  final password = Password.dirty(value: state.password.value);
  final confirmPassword = Confirmpassword.dirty(
    value: state.confirmPassword.value,
    password: state.password.value,
  );

  // Validamos el formulario
  final isValid = Formz.validate([
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword,
  ]);

  // Emitimos el nuevo estado con campos "tocados" y validez
  emit(
    state.copyWith(
      name: name,
      lastname: lastname,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
      isValid: isValid,
    ),
  );

  // Si no es válido, no continuamos
  if (!isValid) return;

  // Indicamos que se está procesando
  emit(state.copyWith(formStatus: FormStatus.validating, response: Loading()));

  // Llamamos al caso de uso del registro (asegúrate de tenerlo en tus use cases)
  final response = await authUsescases.register.run(state.toUser());

  // Emitimos el resultado del registro
  emit(
    state.copyWith(
      formStatus:
          response is Success ? FormStatus.success : FormStatus.failure,
      response: response,
    ),
  );
}


  void _onFormReset(FormReset event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        name: const Username.pure(),
        lastname: const Username.pure(),
        email: const Email.pure(),
        phone: const Phone.pure(),
        password: const Password.pure(),
        confirmPassword: const Confirmpassword.pure(''),
        formStatus: FormStatus.invalid,
        isValid: false,
      ),
    );
  }

  void _onForceValidate(ForceValidate event, Emitter<RegisterState> emit) {
    final name = Username.dirty(value: state.name.value);
    final lastname = Username.dirty(value: state.lastname.value);
    final email = Email.dirty(value: state.email.value);
    final phone = Phone.dirty(value: state.phone.value);
    final password = Password.dirty(value: state.password.value);
    final confirmPassword = Confirmpassword.dirty(
      value: state.confirmPassword.value,
      password: state.password.value,
    );

    emit(
      state.copyWith(
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        isValid: Formz.validate([
          name,
          lastname,
          email,
          phone,
          password,
          confirmPassword,
        ]),
      ),
    );
  }
}
