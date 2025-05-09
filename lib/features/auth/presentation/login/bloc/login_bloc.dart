import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/shared/infrastructure/inputs/inputs.dart';
import 'package:autogas/features/shared/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final formKey = GlobalKey<FormState>();
  LoginUsescase loginUsescase = LoginUsescase();
  LoginBloc() : super(const LoginState()) {
    // on<LoginInitEvent>((event, emit) {
    //   emit(state.copyWith(formKey: formKey));
    // });

    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ForceValidate>(_onForceValidate);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        // formKey: formKey
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email]),
        // formKey: formKey,
      ),
    );
  }

  void _onFormSubmit(FormSubmit event, Emitter<LoginState> emit) async {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);
    final isValid = Formz.validate([email, password]);

    // Actualizamos el estado con campos "tocados"
    emit(state.copyWith(email: email, password: password, isValid: isValid));

    // Si no es válido, no seguimos
    if (!isValid) return;

    // Ahora sí, se emite el estado de carga
    emit(
      state.copyWith(formStatus: FormStatus.validating, response: Loading()),
    );

    // Hacemos el login
  
    final response = await loginUsescase.run(email.value, password.value);

    // Emitimos el resultado del login
    emit(
      state.copyWith(
        formStatus:
            response is Success ? FormStatus.success : FormStatus.failure,
        response: response,
      ),
    );
  }

  void _onForceValidate(ForceValidate event, Emitter<LoginState> emit) {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);

    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
      ),
    );
  }
}
