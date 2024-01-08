import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/data/deeplinks_repository_interface.dart';
import '../data/deeplinks_repository_provider.dart';
part 'deeplinks_service.g.dart';

class DeeplinksService {
  late final IDeeplinksRepoitory _repo;
  DeeplinksService({
    required IDeeplinksRepoitory repo,
  }) {
    _repo = repo;
  }

  StreamSubscription addListener(void Function(Uri) fn) {
    return _repo.addListener(fn);
  }

  Future<Uri?> getInitialDeeplink() async {
    return await _repo.getInitialDeeplink();
  }
}

@Riverpod(keepAlive: true)
DeeplinksService deeplinksService(DeeplinksServiceRef ref) {
  return DeeplinksService(repo: ref.read(deeplinksRepositoryProvider));
}
