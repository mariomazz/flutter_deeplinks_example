import 'package:flutter_deeplinks_example/src/features/deep_links/data/deeplinks_repository.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/data/deeplinks_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'deeplinks_repository_provider.g.dart';

@Riverpod(keepAlive: true)
IDeeplinksRepoitory deeplinksRepository(DeeplinksRepositoryRef ref) {
  return DeeplinksRepository();
}
