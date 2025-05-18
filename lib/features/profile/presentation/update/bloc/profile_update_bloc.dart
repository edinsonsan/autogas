import 'dart:io';

import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/core/usesCases/users/users_usecases.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  AuthUsescases autUsesCase;
  UsersUsecases usersUsecases;

  ProfileUpdateBloc(this.usersUsecases, this.autUsesCase)
    : super(const ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onProfileUpdateInitEvent);
    on<NameChanged>(_onNameChanged);
    on<LastNameChanged>(_onLastnameChanged);
    on<PhoneChanged>(_onPhoneChanged);

    on<FormSubmit>(_onFormSubmit);
    // on<FormReset>(_onFormReset);
    on<ForceValidate>(_onForceValidate);
    on<UpdateUserSession>(_onUpdateUserSession);
  }

  void _onProfileUpdateInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) {
    emit(
      state.copyWith(
        id: event.user?.id,
        name: Username.dirty(value: event.user?.name ?? ''),
        lastname: Username.dirty(value: event.user?.lastname ?? ''),
        phone: Phone.dirty(value: event.user?.phone ?? ''),
      ),
    );
  }

  void _onNameChanged(NameChanged event, Emitter<ProfileUpdateState> emit) {
    final name = event.name;
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name, state.lastname, state.phone]),
        // formKey: formKey
      ),
    );
  }

  void _onLastnameChanged(
    LastNameChanged event,
    Emitter<ProfileUpdateState> emit,
  ) {
    final lastname = event.lastname;
    emit(
      state.copyWith(
        lastname: lastname,
        isValid: Formz.validate([state.name, lastname, state.phone]),
        // formKey: formKey
      ),
    );
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<ProfileUpdateState> emit) {
    final phone = event.phone;
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([state.name, state.lastname, phone]),
        // formKey: formKey
      ),
    );
  }

  void _onUpdateUserSession(
    UpdateUserSession event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    AuthResponse authResponse = await autUsesCase.getUserSesion.run();

    final updatedUser = authResponse.user.copyWith(
      name: event.user.name,
      lastname: event.user.lastname,
      phone: event.user.phone,
      image: event.user.image,
    );

    final updatedAuthResponse = authResponse.copyWith(user: updatedUser);

    await autUsesCase.saveUserSesion.run(updatedAuthResponse);
  }

  void _onFormSubmit(FormSubmit event, Emitter<ProfileUpdateState> emit) async {
    print('Name: ${state.name.value}');
    print('LastName: ${state.lastname.value}');
    print('Phone: ${state.phone.value}');
    // Marcamos los campos como "dirty" para que se actualice su validación
    final name = Username.dirty(value: state.name.value);
    final lastname = Username.dirty(value: state.lastname.value);
    final phone = Phone.dirty(value: state.phone.value);

    // Validamos el formulario
    final isValid = Formz.validate([name, lastname, phone]);

    // Emitimos el nuevo estado con campos "tocados" y validez
    emit(
      state.copyWith(
        name: name,
        lastname: lastname,
        phone: phone,
        isValid: isValid,
      ),
    );

    // Si no es válido, no continuamos
    if (!isValid) return;

    // Indicamos que se está procesando
    emit(
      state.copyWith(formStatus: FormStatus.validating, response: Loading()),
    );

    // Llamamos al caso de uso del registro (asegúrate de tenerlo en tus use cases)
    final response = await usersUsecases.update.run(
      state.id,
      state.toUser(),
      null,
    );

    // Emitimos el resultado del registro
    emit(
      state.copyWith(
        formStatus:
            response is Success ? FormStatus.success : FormStatus.failure,
        response: response,
      ),
    );
  }

  void _onForceValidate(ForceValidate event, Emitter<ProfileUpdateState> emit) {
    final name = Username.dirty(value: state.name.value);
    final lastname = Username.dirty(value: state.lastname.value);
    final phone = Phone.dirty(value: state.phone.value);

    emit(
      state.copyWith(
        name: name,
        lastname: lastname,
        phone: phone,
        isValid: Formz.validate([name, lastname, phone]),
      ),
    );
  }
}
