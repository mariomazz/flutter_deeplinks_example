import 'package:flutter/material.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/application/deeplinks_service.dart';
import 'package:flutter_deeplinks_example/src/features/notifications/data/notifications_repository.mock.dart';
import 'package:flutter_deeplinks_example/src/routing/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';
import 'src/features/notifications/data/notifications_repository_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final rivContainer = ProviderContainer(overrides: [
    // push notifications mocked
    notificationsRepositoryProvider
        .overrideWith((ref) => NotificationsRepositoryMock())
  ]);
  final goRouter = rivContainer.read(goRouterProvider);

  rivContainer.read(deeplinksServiceProvider).addListener((value) async {
    // locale deeplinks managment
    await Future.delayed(const Duration(milliseconds: 500), () async {
      final queryParameters = Map<String, String>.from(value.queryParameters);
      final isLocalDeeplink =
          bool.tryParse(queryParameters["local"] ?? '..') ?? false;
      if (isLocalDeeplink) {
        await goRouter.push("/${value.host.replaceAll(".", "/")}?${value.query}");
      } else {
        await goRouter.push("/${value.path}?${value.query}");
      }
    });
  });

  runApp(
    UncontrolledProviderScope(
      container: rivContainer,
      child: const App(),
    ),
  );
}
