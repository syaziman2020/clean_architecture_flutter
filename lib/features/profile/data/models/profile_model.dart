import 'package:clean_architecture_learn/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  final String firstName;
  final String lastName;

  const ProfileModel({
    required super.imageUrl,
    required this.firstName,
    required this.lastName,
    required super.email,
    required super.id,
  }) : super(fullName: '$firstName $lastName');

  //convert dari json to object dart (GET request)
  factory ProfileModel.fromJson(Map<String, dynamic> dataJson) {
    Map<String, dynamic> json = dataJson["data"];
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
}
