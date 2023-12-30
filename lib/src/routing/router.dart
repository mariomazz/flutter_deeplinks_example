import 'package:asf_flutter_common/asf_flutter_common.dart';
import 'package:flutter_deeplinks_example/src/common/widgets/screens/deeplink_detail.dart';
import 'package:flutter_deeplinks_example/src/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../common/widgets/screens/home.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: "/$homeRoute",
    routes: [
      GoRoute(
        path: "/$homeRoute",
        pageBuilder: (ctx, state) {
          return buildPageWithFadeTransition(
            state: state,
            child: const HomeScreen(),
            context: ctx,
          );
        },
        routes: [
          GoRoute(
            path: deeplinkDetailRoute,
            pageBuilder: (ctx, state) {
              return buildPageWithFadeTransition(
                state: state,
                child: const DeepLinkDetailScreen(),
                context: ctx,
              );
            },
          ),
        ],
      ),
    ],
  );
}
