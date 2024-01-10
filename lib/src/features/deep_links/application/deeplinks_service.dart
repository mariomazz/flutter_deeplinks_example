import 'dart:async';
import 'package:asf_flutter_common/asf_flutter_common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_deeplinks_example/src/features/deep_links/data/deeplinks_repository_interface.dart';
import '../../notifications/application/notifications_service.dart';
import '../data/deeplinks_repository_provider.dart';
part 'deeplinks_service.g.dart';

class DeeplinksService {
  late final NotificationsService _notificationsService;
  late final IDeeplinksRepoitory _repo;
  final _deeplinksStreamController = StreamController<Uri>.broadcast();
  final _subs = <StreamSubscription>[];

  DeeplinksService({
    required IDeeplinksRepoitory repo,
    required NotificationsService notificationsService,
  }) {
    _repo = repo;
    _notificationsService = notificationsService;
    _initialize();
  }

  void _initialize() {
    _subs.add(_repo.addListener(_deeplinksStreamController.sink.add));
    Future.delayed(Duration.zero, () {
      _notificationsService.notificationDeepLink().then((value) {
        if (value != null) {
          _deeplinksStreamController.sink.add(value.requireUri);
        }
      });
    });
  }

  StreamSubscription<Uri> addListener(void Function(Uri) fn) {
    final sub = _deeplinksStreamController.stream.distinct().listen(fn);
    _subs.add(sub);
    return sub;
  }

  Future<Uri?> getInitialDeeplink() async {
    return await _repo.getInitialDeeplink();
  }

  void _dispose() async {
    // ignore: avoid_function_literals_in_foreach_calls
    _subs.forEach((element) async {
      await element.cancel();
    });
    await _deeplinksStreamController.close();
  }
}

@Riverpod(keepAlive: true)
DeeplinksService deeplinksService(DeeplinksServiceRef ref) {
  final service = DeeplinksService(
      repo: ref.read(deeplinksRepositoryProvider),
      notificationsService: ref.read(notificationsServiceProvider));
  ref.onDispose(() {
    service._dispose();
  });
  return service;
}
