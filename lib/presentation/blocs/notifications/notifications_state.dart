part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {

  //* En este estado queremos saber el estado de nuestras notidficaciones
  final AuthorizationStatus status;
  //TODO: Crear mi modelo de notificaciones

  // *Acá tendremos todas nuestras notificaciones push 
  final List<PushMessage> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined, 
    this.notifications = const []
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications
  }) => NotificationsState(
    status: status ?? this.status,
    notifications: notifications ?? this.notifications
  );
  
  @override
  List<Object> get props => [ status, notifications ];
}
