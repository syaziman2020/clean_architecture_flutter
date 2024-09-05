import 'package:hive/hive.dart';

import '../../domain/entities/profile.dart';
part 'profile_model.g.dart'; //hive generated

@HiveType(typeId: 1)
class ProfileModel extends Profile {
  @HiveField(4)
  final String firstName;
  @HiveField(5)
  final String lastName;
  const ProfileModel({
    required super.imageUrl,
    required this.firstName,
    required this.lastName,
    required super.email,
    required super.id,
  }) : super(fullName: '$firstName $lastName');

  //convert dari json to object dart (GET request)
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      imageUrl: json['avatar'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      id: json['id'],
    );
  }

  //convert object dart ke json (POST request)
  Map<String, dynamic> toJson() {
    return {
      "avatar": imageUrl,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "id": id,
    };
  }

  static List<ProfileModel> fromJsonList(List data) {
    if (data.isEmpty) {
      return [];
    }
    return data.map((e) => ProfileModel.fromJson(e)).toList();
  }
}
