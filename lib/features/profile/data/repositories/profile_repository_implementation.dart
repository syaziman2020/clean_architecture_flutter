import '../../../../core/error/failure.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final HiveInterface hive;
  ProfileRepositoryImplementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.hive});

  @override
  Future<Either<Failure, List<Profile>>> getAllProfiles(int page) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<ProfileModel> result = await localDataSource.getAllProfiles(page);
        return Right(result);
      } else {
        List<ProfileModel> result = await remoteDataSource.getAllProfiles(page);
        var box = hive.box("profile_box");
        box.put('getAllProfiles', result);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getProfileById(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        ProfileModel result = await localDataSource.getProfileById(id);
        return Right(result);
      } else {
        ProfileModel result = await remoteDataSource.getProfileById(id);
        var box = hive.box("profile_box");
        box.put('getProfile', result);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
