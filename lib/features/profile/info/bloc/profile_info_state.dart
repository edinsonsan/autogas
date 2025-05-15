part of 'profile_info_bloc.dart';

class ProfileInfoState extends Equatable {
  final User? user;
  const ProfileInfoState({this.user});

  ProfileInfoState copyWith({User? user}) => ProfileInfoState(user: user);

  @override
  List<Object?> get props => [user];
}
