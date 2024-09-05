import 'package:clean_architecture_learn/injection.dart';

import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'All Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: myInjection<ProfileBloc>()..add(const ProfileListEvent(1)),
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileFailed) {
            return const Center(child: Text('Failed to load data'));
          } else if (state is ProfileListSuccess) {
            List<Profile> listUser = state.profileList;
            return ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                // Profile profile = listUser[index];
                return ListTile(
                  onTap: () {
                    context.pushNamed('detail_user', extra: listUser[index].id);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(listUser[index].imageUrl),
                  ),
                  title: Text(
                    listUser[index].fullName,
                  ),
                );
              },
            );
          } else {
            return const SizedBox
                .shrink(); // Placeholder for when state is null or unknown.
          }
        },
      ),
    );
  }
}
