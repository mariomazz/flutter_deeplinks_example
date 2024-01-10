import 'dart:async';
import 'model/notification.dart';

abstract class INotificationsRepository {
  Future<Notification?> getInitialNotification();
}
