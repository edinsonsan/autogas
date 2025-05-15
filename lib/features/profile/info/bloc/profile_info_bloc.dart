import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
// import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUsescases authUseCases;
  ProfileInfoBloc(this.authUseCases) : super(const ProfileInfoState()) {
    on<GetUserInfo>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSesion.run();
      emit(state.copyWith(user: authResponse.user));
    });
  }
}
