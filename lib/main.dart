import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';

void main() {
  final rivContainer = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: rivContainer,
      child: const App(),
    ),
  );
}
