part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFailed extends ProfileState {
  final String message;
  const ProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

class ProfileListSuccess extends ProfileState {
  final List<Profile> profileList;
  const ProfileListSuccess(this.profileList);

  @override
  List<Object> get props => [profileList];
}

class ProfileSuccess extends ProfileState {
  final Profile profile;
  const ProfileSuccess(this.profile);

  @override
  List<Object> get props => [profile];
}
