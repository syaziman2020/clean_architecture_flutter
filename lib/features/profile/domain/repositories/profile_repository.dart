import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllProfiles(int page);
  Future<Either<Failure, Profile>> getProfileById(int id);
}
