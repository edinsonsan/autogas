part of 'profile_info_bloc.dart';

sealed class ProfileInfoEvent {
  const ProfileInfoEvent();
}

class GetUserInfo extends ProfileInfoEvent {}
