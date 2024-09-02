part of 'notifications_bloc.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();

  // @override
  // List<Object> get props => [];
}
class NotificatioStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificatioStatusChanged(this.status);
}


 class NotificationRecived extends NotificationsEvent {
  final PushMessage pushMessage;

  NotificationRecived(this.pushMessage);
 }
