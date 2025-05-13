import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  AuthUsescases authUsesCases;
  ForgotBloc( this.authUsesCases ) : super(const ForgotState()) {
    on<EmailChanged>(_onEmailChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ForceValidate>(_onForceValidate);
  }

  void _onEmailChanged(EmailChanged event, Emitter<ForgotState> emit) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
        // formKey: formKey
      ),
    );
  }

  void _onFormSubmit(FormSubmit event, Emitter<ForgotState> emit) async {
    final email = Email.dirty(value: state.email.value);
    final isValid = Formz.validate([email]);
    // Actualizamos el estado con campos "tocados"
    emit(state.copyWith(email: email, isValid: isValid));

    // Si no es válido, no seguimos
    if (!isValid) return;

    // Ahora sí, se emite el estado de carga
    emit(
      state.copyWith(formStatus: FormStatus.validating, response: Loading()),
    );

    // Hacemos el login

    final response = await authUsesCases.forgot.run(email.value);

    // Emitimos el resultado del login
    emit(
      state.copyWith(
        formStatus:
            response is Success ? FormStatus.success : FormStatus.failure,
        response: response,
      ),
    );

  }

  void _onForceValidate(ForceValidate event, Emitter<ForgotState> emit) {
    final email = Email.dirty(value: state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
        ]),
      ),
    );
  }
}
