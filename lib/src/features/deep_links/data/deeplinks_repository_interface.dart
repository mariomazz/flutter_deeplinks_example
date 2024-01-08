import 'dart:async';

abstract class IDeeplinksRepoitory {
  StreamSubscription addListener(void Function(Uri newDeeplink) fn);
  Future<Uri?> getInitialDeeplink();
}
