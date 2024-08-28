import 'package:clean_architecture_learn/core/error/failure.dart';
import 'package:clean_architecture_learn/features/profile/domain/entities/profile.dart';
import 'package:clean_architecture_learn/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProfiles {
  final ProfileRepository profileRepository;
  const GetAllProfiles(this.profileRepository);

  Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await profileRepository.getAllProfiles(page);
  }
}
