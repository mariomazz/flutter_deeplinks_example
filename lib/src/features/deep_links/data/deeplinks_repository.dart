import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/data/deeplinks_repository_interface.dart';

class DeeplinksRepository implements IDeeplinksRepoitory {
  @override
  StreamSubscription addListener(void Function(Uri newDeeplink) fn) {
    final appLinks = AppLinks();
    return appLinks.allUriLinkStream.listen(fn);
  }

  @override
  Future<Uri?> getInitialDeeplink() async {
    final appLinks = AppLinks();
    return await appLinks.getInitialAppLink();
  }
}
