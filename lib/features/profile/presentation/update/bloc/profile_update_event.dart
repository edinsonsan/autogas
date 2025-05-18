part of 'profile_update_bloc.dart';

sealed class ProfileUpdateEvent {
  const ProfileUpdateEvent();
}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;
  ProfileUpdateInitEvent({ required this.user});
}

class NameChanged extends ProfileUpdateEvent {
  final Username name;
  NameChanged({ required this.name });
}

class LastNameChanged extends ProfileUpdateEvent {
  final Username lastname;
  LastNameChanged({ required this.lastname });
}

class PhoneChanged extends ProfileUpdateEvent {
  final Phone phone;
  PhoneChanged({ required this.phone });
}

class UpdateUserSession extends ProfileUpdateEvent {
  final User user;
  UpdateUserSession({ required this.user });
}

class ForceValidate extends ProfileUpdateEvent {}


class PickImage extends ProfileUpdateEvent {}
class TakePhoto extends ProfileUpdateEvent {}
class FormSubmit extends ProfileUpdateEvent {}


