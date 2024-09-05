import 'package:hive/hive.dart';

import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<ProfileModel>> getAllProfiles(int page);
  Future<ProfileModel> getProfileById(int id);
}

class ProfileLocalDataSourceImplementation extends ProfileLocalDataSource {
  final Box box;
  ProfileLocalDataSourceImplementation({required this.box});
  @override
  Future<List<ProfileModel>> getAllProfiles(int page) async {
    return box.get('getAllProfiles');
  }

  @override
  Future<ProfileModel> getProfileById(int id) async {
    return box.get('getProfile');
  }
}
