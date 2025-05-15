import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUsescases authUseCases;
  ClientHomeBloc(this.authUseCases) : super( const ClientHomeState()) {

    on<ChangeDrawerPage>((event, emit) {
      emit(
        state.copyWith(
          pageIndex: event.pageIndex
        )
      );
    });

    on<Logout>((event, emit) async {
      await authUseCases.logout.run();
    });
  }
}
