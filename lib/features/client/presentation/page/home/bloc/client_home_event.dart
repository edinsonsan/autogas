part of 'client_home_bloc.dart';

sealed class ClientHomeEvent {
  const ClientHomeEvent();
}

class ChangeDrawerPage extends ClientHomeEvent {
  final int pageIndex;
  ChangeDrawerPage({ required this.pageIndex });
}

class Logout extends ClientHomeEvent {}