import 'package:clean_architecture_learn/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:clean_architecture_learn/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<ProfileRemoteDataSource>()])
import 'profile_remote_datasource_test.mocks.dart';

void main() {
  // Create mock object.
  var profileRemoteDataSource = MockProfileRemoteDataSource();

  const int userId = 1;
  const int page = 1;

  ProfileModel fakeProfileModel = const ProfileModel(
    imageUrl: "http://gambar.com",
    firstName: "user1",
    lastName: " $userId",
    email: "user1@mail.com",
    id: userId,
  );

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
  });
}
