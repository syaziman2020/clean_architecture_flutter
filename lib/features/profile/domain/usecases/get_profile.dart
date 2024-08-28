import 'package:clean_architecture_learn/core/error/failure.dart';
import 'package:clean_architecture_learn/features/profile/domain/entities/profile.dart';
import 'package:clean_architecture_learn/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final ProfileRepository profileRepository;
  const GetUser(this.profileRepository);

  Future<Either<Failure, Profile>> execute(int id) {
    return profileRepository.getProfileById(id);
  }
}
