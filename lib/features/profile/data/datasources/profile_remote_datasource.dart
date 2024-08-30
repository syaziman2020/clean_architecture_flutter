import 'dart:convert';

import '../models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getAllProfiles(int page);
  Future<ProfileModel> getProfileById(int id);
}

class ProfileRemoteDataSourceImplementation extends ProfileRemoteDataSource {
  @override
  Future<List<ProfileModel>> getAllProfiles(int page) async {
    final Uri url = Uri.parse('https://reqres.in/api/users?page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];

      return ProfileModel.fromJsonList(result);
    }
    throw Exception('Failed to fetch data');
  }

  @override
  Future<ProfileModel> getProfileById(int id) async {
    final Uri url = Uri.parse('https://reqres.in/api/users/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      return ProfileModel.fromJson(result);
    }
    throw Exception('Failed to fetch data');
  }
}
