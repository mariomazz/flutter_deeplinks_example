import 'package:asf_flutter_common/asf_flutter_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deeplinks_example/src/common/widgets/screens/room_detail_screen.dart';
import 'package:flutter_deeplinks_example/src/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../common/widgets/screens/home.dart';
part 'router.g.dart';

final _mainKey = GlobalKey<NavigatorState>(debugLabel: "_mainShellKey");
final _shellRoomDetailKey = GlobalKey<NavigatorState>(debugLabel: "_shellRoomDetailKey");

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/$homeRoute",
    navigatorKey: _mainKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _mainKey,
        path: "/$homeRoute",
        pageBuilder: (ctx, state) {
          return buildPageWithFadeTransition(
            state: state,
            child: HomeScreen(key: state.pageKey),
            context: ctx,
          );
        },
        routes: [
          StatefulShellRoute.indexedStack(
            parentNavigatorKey: _mainKey,
            pageBuilder: (ctx, state, shell) => buildPageWithFadeTransition(
              state: state,
              child: Scaffold(
                key: state.pageKey,
                body: shell,
              ),
              context: ctx,
            ),
            branches: [
              StatefulShellBranch(
                navigatorKey: _shellRoomDetailKey,
                routes: [
                  GoRoute(
                    path: roomDetailRoute,
                    pageBuilder: (ctx, state) {
                      return buildPageWithFadeTransition(
                        state: state,
                        child: RoomDetailScreen(key: state.pageKey, fixedAppBarLeading: true),
                        context: ctx,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
