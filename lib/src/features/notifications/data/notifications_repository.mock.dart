import 'dart:async';
import 'model/notification.dart';
import 'notifications_repository_interface.dart';

class NotificationsRepositoryMock implements INotificationsRepository {
  @override
  Future<Notification?> getInitialNotification() async {
    return Notification(id: "000_333", payload: {
      Notification.deeplinkDefinedKey:
          "com.example.flutterdeeplinksexample://home.roomDetailScreen?local=true"
    });
  }
}
