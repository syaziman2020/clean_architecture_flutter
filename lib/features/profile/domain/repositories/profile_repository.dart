import 'package:clean_architecture_learn/core/error/failure.dart';
import 'package:clean_architecture_learn/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllProfiles(int page);
  Future<Either<Failure, Profile>> getProfileById(int id);
}
