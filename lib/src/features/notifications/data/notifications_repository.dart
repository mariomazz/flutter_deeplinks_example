import 'dart:async';
import 'model/notification.dart';
import 'notifications_repository_interface.dart';

class NotificationsRepository implements INotificationsRepository {
  @override
  Future<Notification?> getInitialNotification() async {
    throw UnimplementedError();
  }
}
