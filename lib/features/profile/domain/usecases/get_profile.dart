import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfile {
  final ProfileRepository profileRepository;
  const GetProfile(this.profileRepository);

  Future<Either<Failure, Profile>> execute(int id) async {
    return await profileRepository.getProfileById(id);
  }
}
