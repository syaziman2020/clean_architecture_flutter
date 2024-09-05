import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Profile extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String imageUrl;
  const Profile(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, fullName, imageUrl];
}
