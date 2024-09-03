import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';//* Se corrige a "flutter_bloc"
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

// There are a few things to keep in mind about your background message handler:
// It must not be an anonymous function.
// It must be a top-level function (e.g. not a class method which requires initialization).
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
    // ignore: avoid_print
  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {

  //* Instanciamos "FirebaseMessaging"
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //* Se modifica el "NotificationsInitial" por "NotificationsState"
  NotificationsBloc() : super(const NotificationsState()) {
    
    on<NotificatioStatusChanged>(_notificationStatusChanged);

    on<NotificationRecived>(_onPushMessageRecived);

    //* Verificar estado de las notificaciones
    _initialStatusCheck();

    //* Listener for notifications in Foreground
    _onForegroundMessage();
  }
  void _notificationStatusChanged( NotificatioStatusChanged event, Emitter<NotificationsState> emit ) {
    emit(
      state.copyWith(
        status: event.status
      )
    );
    _getFCMToken();
  }

  void _onPushMessageRecived( NotificationRecived event, Emitter<NotificationsState> emit ) {
    emit(
      state.copyWith(
        notifications: [ event.pushMessage, ...state.notifications ]
      )
    );
  }

  void _initialStatusCheck() async {
    final settings =  await messaging.getNotificationSettings();
    add( NotificatioStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    if(state.status != AuthorizationStatus.authorized) return;
    final token = await messaging.getToken();
    // ignore: avoid_print
    print('Token de la app: $token');
  }


  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }

  void handleRemoteMessage(RemoteMessage message) {
    if(message.notification == null) return;

    final notification = PushMessage(
      messageId: message.messageId
        ?.replaceAll(':', '').replaceAll('%', '')
        ?? '', 
      title: message.notification!.title ?? '', 
      body: message.notification!.body ?? '', 
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid 
        ? message.notification!.android?.imageUrl 
        : message.notification!.apple?.imageUrl
    );

  add(NotificationRecived(notification));


    // ignore: avoid_print
    print('Notificación: $notification');

  }

  //* Para escuchar mensajes mientras la aplicación está en primer plano, escuche la onMessage transmisión.
  void _onForegroundMessage(){
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  add(NotificatioStatusChanged(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String pushMessageId) {
    final exist = state.notifications.any((element)=> element.messageId == pushMessageId);

    if(!exist) return null;
    return state.notifications.firstWhere((element) => element.messageId == pushMessageId);
  }
}
