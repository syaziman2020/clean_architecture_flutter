// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:clean_architecture_learn/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:clean_architecture_learn/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks(
    [MockSpec<ProfileRemoteDataSource>(), MockSpec<http.Client>()])
import 'profile_remote_datasource_test.mocks.dart';

void main() {
  // Create mock object.
  final profileRemoteDataSource = MockProfileRemoteDataSource();
  MockClient mockClient = MockClient();
  var remoteDataSourceImplementation =
      ProfileRemoteDataSourceImplementation(httpClient: mockClient);

  const int userId = 1;
  const int page = 1;
  final Uri urlGetProfileById =
      Uri.parse('https://reqres.in/api/users/$userId');

  final Uri urlGetAllProfiles =
      Uri.parse('https://reqres.in/api/users?page=$page');

  final Map<String, dynamic> fakeDataJson = {
    "id": userId,
    "email": "user1@example.com",
    "first_name": "User",
    "last_name": " $userId",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  };

  ProfileModel fakeProfileModel = ProfileModel.fromJson(fakeDataJson);

  group("Profile Remote Datasource", () {
    group("Abstract", () {
      group("getProfileById()", () {
        test("Success", () async {
          when(profileRemoteDataSource.getProfileById(userId))
              .thenAnswer((_) async => fakeProfileModel);

          try {
            final response =
                await profileRemoteDataSource.getProfileById(userId);

            expect(response, fakeProfileModel);
          } catch (e) {
            fail("An error occurred: $e");
          }
        });
        test("Failed", () async {
          when(profileRemoteDataSource.getProfileById(userId))
              .thenThrow(Exception());

          try {
            final response =
                await profileRemoteDataSource.getProfileById(userId);

            fail("An error occurred, it cannot happen");
          } catch (e) {
            expect(e, isException);
          }
        });
      });
      group("getProfileAllProfiles", () {
        test("Success", () async {
          when(profileRemoteDataSource.getAllProfiles(page))
              .thenAnswer((_) async => [fakeProfileModel]);

          try {
            final response = await profileRemoteDataSource.getAllProfiles(page);

            expect(response, [fakeProfileModel]);
          } catch (e) {
            fail("An error occurred: $e");
          }
        });
        test("Failed", () async {
          when(profileRemoteDataSource.getAllProfiles(page))
              .thenThrow(Exception());

          try {
            final response = await profileRemoteDataSource.getAllProfiles(page);

            fail("An error occurred, it cannot happen");
          } catch (e) {
            expect(e, isException);
          }
        });
      });
    });
    group("Implementation", () {
      group("getProfileById()", () {
        test("Success", () async {
          when(mockClient.get(urlGetProfileById)).thenAnswer(
            (_) async => http.Response(
              jsonEncode({
                "data": fakeDataJson,
              }),
              200,
            ),
          );

          try {
            final response =
                await remoteDataSourceImplementation.getProfileById(userId);

            expect(response, fakeProfileModel);
          } catch (e) {
            fail("An error occurred: $e");
          }
        });
        test("Failed 404", () async {
          when(mockClient.get(urlGetProfileById)).thenAnswer(
            (_) async => http.Response(
              jsonEncode({}),
              404,
            ),
          );

          try {
            await remoteDataSourceImplementation.getProfileById(userId);

            fail("An error occurred, it cannot happen");
          } catch (e) {
            expect(e, isException);
          }
        });
      });
      group("getProfileAllProfiles", () {
        test("Success", () async {
          when(mockClient.get(urlGetAllProfiles)).thenAnswer(
            (_) async => http.Response(
              jsonEncode({
                "data": [fakeDataJson],
              }),
              200,
            ),
          );

          try {
            final response =
                await remoteDataSourceImplementation.getAllProfiles(page);

            expect(response, [fakeProfileModel]);
          } catch (e) {
            fail("An error occurred: $e");
          }
        });
        test("Failed", () async {
          when(mockClient.get(urlGetAllProfiles)).thenAnswer(
            (_) async => http.Response(
              jsonEncode({}),
              404,
            ),
          );

          try {
            await remoteDataSourceImplementation.getAllProfiles(page);

            fail("An error occurred, it cannot happen");
          } catch (e) {
            expect(e, isException);
          }
        });
      });
    });
  });
}
