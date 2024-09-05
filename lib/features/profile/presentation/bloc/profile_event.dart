part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileListEvent extends ProfileEvent {
  final int page;
  const ProfileListEvent(this.page);

  @override
  List<Object> get props => [page];
}

class ProfileDetailEvent extends ProfileEvent {
  final int userId;
  const ProfileDetailEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
