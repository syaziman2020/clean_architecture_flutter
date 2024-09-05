import 'package:bloc/bloc.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_all_profiles.dart';
import '../../domain/usecases/get_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetAllProfiles getAllProfiles;
  final GetProfile getProfiles;
  ProfileBloc({
    required this.getAllProfiles,
    required this.getProfiles,
  }) : super(ProfileInitial()) {
    on<ProfileListEvent>((event, emit) async {
      emit(ProfileLoading());
      Either<Failure, List<Profile>> result =
          await getAllProfiles.execute(event.page);

      result.fold((l) => emit(const ProfileFailed('Error in your system')),
          (r) => emit(ProfileListSuccess(r)));
    });
    on<ProfileDetailEvent>((event, emit) async {
      emit(ProfileLoading());
      Either<Failure, Profile> result = await getProfiles.execute(event.userId);

      result.fold((l) => emit(const ProfileFailed('Error in your system')),
          (r) => emit(ProfileSuccess(r)));
    });
  }
}
