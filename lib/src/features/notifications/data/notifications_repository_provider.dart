import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'notifications_repository.dart';
import 'notifications_repository_interface.dart';
part 'notifications_repository_provider.g.dart';

@Riverpod(keepAlive: true)
INotificationsRepository notificationsRepository(NotificationsRepositoryRef ref) {
  return NotificationsRepository();
}
