import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProfiles {
  final ProfileRepository profileRepository;
  const GetAllProfiles(this.profileRepository);

  Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await profileRepository.getAllProfiles(page);
  }
}
