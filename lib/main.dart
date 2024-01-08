import 'package:flutter/material.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/application/deeplinks_service.dart';
import 'package:flutter_deeplinks_example/src/routing/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final rivContainer = ProviderContainer();
  final goRouter = rivContainer.read(goRouterProvider);

  rivContainer.read(deeplinksServiceProvider).addListener((value) async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      goRouter.push("/${value.host.replaceAll("-", "/")}");
    });
  });

  runApp(
    UncontrolledProviderScope(
      container: rivContainer,
      child: const App(),
    ),
  );
}
