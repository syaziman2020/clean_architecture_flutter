import 'core/routes/my_router.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

import 'injection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myInjection<ProfileBloc>(),
      child: MaterialApp.router(
        routerConfig: MyRouter().router,
      ),
    );
  }
}
