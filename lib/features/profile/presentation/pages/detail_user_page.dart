import 'package:clean_architecture_learn/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';

class DetailUserPage extends StatelessWidget {
  final int id;
  const DetailUserPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Detail User ke-$id',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: myInjection<ProfileBloc>()..add(ProfileDetailEvent(id)),
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccess) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      state.profile.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Name: ${state.profile.fullName}'),
                Text('Email: ${state.profile.email}'),
                const SizedBox(height: 20),
              ],
            );
          } else if (state is ProfileFailed) {
            return const Text('Failed to load profile');
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
