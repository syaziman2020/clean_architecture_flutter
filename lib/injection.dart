import 'features/profile/domain/repositories/profile_repository.dart';

import 'features/profile/data/datasources/profile_local_datasource.dart';
import 'features/profile/data/datasources/profile_remote_datasource.dart';
import 'features/profile/data/models/profile_model.dart';
import 'features/profile/data/repositories/profile_repository_implementation.dart';
import 'features/profile/domain/usecases/get_all_profiles.dart';
import 'features/profile/domain/usecases/get_profile.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

final myInjection = GetIt.instance;

Future<void> init() async {
  Hive.registerAdapter(ProfileModelAdapter());
  final box = await Hive.openBox('profile_box');

  myInjection.registerLazySingleton(() => box);
  myInjection.registerLazySingleton(() => http.Client());

  myInjection.registerFactory(
    () => ProfileBloc(
      getAllProfiles: myInjection(),
      getProfiles: myInjection(),
    ),
  );

  myInjection.registerLazySingleton(
    () => GetAllProfiles(myInjection()),
  );
  myInjection.registerLazySingleton(
    () => GetProfile(myInjection()),
  );

  myInjection.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplementation(
        remoteDataSource: myInjection(),
        localDataSource: myInjection(),
        box: myInjection()),
  );

  myInjection.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImplementation(box: myInjection()),
  );

  myInjection.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImplementation(
      httpClient: myInjection(),
    ),
  );
}
