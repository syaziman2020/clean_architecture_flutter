import 'package:clean_architecture_learn/features/profile/data/models/profile_model.dart';
import 'package:hive/hive.dart';

abstract class ProfileLocalDataSource {
  Future<List<ProfileModel>> getAllProfiles(int page);
  Future<ProfileModel> getProfileById(int id);
}

class ProfileLocalDataSourceImplementation extends ProfileLocalDataSource {
  final HiveInterface hive;
  ProfileLocalDataSourceImplementation({required this.hive});
  @override
  Future<List<ProfileModel>> getAllProfiles(int page) async {
    var box = hive.box('profile_box');
    return box.get('getAllProfiles');
  }

  @override
  Future<ProfileModel> getProfileById(int id) async {
    var box = hive.box('profile_box');
    return box.get('getProfile');
  }
}
