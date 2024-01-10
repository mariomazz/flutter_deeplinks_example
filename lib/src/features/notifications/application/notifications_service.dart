import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/model/notification.dart';
import '../data/notifications_repository_interface.dart';
import '../data/notifications_repository_provider.dart';
part 'notifications_service.g.dart';

class NotificationsService {
  late final INotificationsRepository _repo;
  
  NotificationsService({
    required INotificationsRepository repo,
  }) {
    _repo = repo;
  }

  // on notification start background app
  Future<Notification?> getInitialNotification() async {
    return await _repo.getInitialNotification();
  }

  Future<String?> notificationDeepLink() async {
    return await getInitialNotification().then((value) => value?.payload[Notification.deeplinkDefinedKey]);
  }
}

@Riverpod(keepAlive: true)
NotificationsService notificationsService(NotificationsServiceRef ref) {
  return NotificationsService(repo: ref.read(notificationsRepositoryProvider));
}
