import 'package:clean_architecture_learn/features/profile/presentation/pages/all_users_page.dart';
import 'package:clean_architecture_learn/features/profile/presentation/pages/detail_user_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  get router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/',
              name: 'all_users',
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: AllUsersPage(),
                  ),
              routes: [
                GoRoute(
                  path: 'detail-user',
                  name: 'detail_user',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: DetailUserPage(
                        id: state.extra as int,
                      ),
                    );
                  },
                ),
              ])
        ],
      );
}
