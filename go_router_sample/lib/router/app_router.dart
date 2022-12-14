import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/route_path.dart';
import 'package:go_router_sample/router/scaffold_with_nav_bar.dart';
import 'package:go_router_sample/screens/error/error_screen.dart';
import 'package:go_router_sample/screens/login/login_screen.dart';
import 'package:go_router_sample/screens/product/product_screen.dart';
import 'package:go_router_sample/screens/product/product_detail_screen.dart';
import 'package:go_router_sample/screens/profile/profile_edit_screen.dart';
import 'package:go_router_sample/screens/search/search_screen.dart';
import 'package:go_router_sample/screens/search/screen_result_screen.dart';
import 'package:go_router_sample/screens/profile/profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePath.loginPath,
    refreshListenable: RouterNotifier(ref),
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.loginPath,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
        redirect: (context, state) async {
          final isLoggedIn = ref.read(isLoggedInProvider);
          if (isLoggedIn) return RoutePath.productPath;
          return null;
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithBottomNavBar(child: child),
        routes: [
          GoRoute(
            path: RoutePath.productPath,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProductScreen(),
            ),
            routes: [
              GoRoute(
                path: RoutePath.detailPath,
                builder: (BuildContext context, GoRouterState state) =>
                    const ProductDetailScreen(),
              ),
            ],
          ),
          GoRoute(
            path: RoutePath.searchPath,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SearchScreen(),
            ),
            routes: [
              GoRoute(
                path: RoutePath.resultPath,
                // parentNavigatorKeyを指定すると、BNBが無しになる
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) =>
                    const SearchResultScreen(),
              ),
            ],
          ),
          GoRoute(
            path: RoutePath.profilePath,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
            routes: [
              GoRoute(
                  path: '${RoutePath.editPath}/:user_name/:email',
                  builder: (BuildContext context, GoRouterState state) {
                    final userName = state.params['user_name']!;
                    final email = state.params['email']!;
                    return ProfileEditScreen(
                      userName: userName,
                      email: email,
                    );
                  }),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  ),
);

final isLoggedInProvider = StateProvider<bool>((ref) => false);

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen<bool>(
      isLoggedInProvider,
      (_, __) => notifyListeners(),
    );
  }
  final Ref _ref;
}


// streamの場合はこんな感じ refreshListenable: GoRouterRefreshStream(ref.watch(authStreamProvider))
// final authStreamProvider = StreamProvider<bool>((ref) => Stream.value(false));

// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//           (dynamic _) => notifyListeners(),
//         );
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
