# push_app

A new Flutter project.

1. Instalamos firebase en nuestro proyecto mediante la consola "flutter pub add firebase_messaging"
2. O mediante el Pub Assist "firebase_messaging"
3. Instalamos el Firebase CLI en nuestro equipo: https://firebase.google.com/docs/cli?hl=es-419
4. Desde la terminal ejecuta el siguiente curl: curl -sL https://firebase.tools | bash
5. Una vez finalizado, cerrar la terminal y volverla a abrir y ejecutar el cmd: firebase login
6. loguearse en el navegador
7. Cambiarl el nombre de la app en el namespace de la siguiente ruta y en todos los demás lugares: android/app/build.gradle
8. Cambiar el nombre del folder example por el nombre de la ruta que pusimos despues del com. android/app/src/main/kotlin/com/pablolara/push_app/MainActivity.kt
9. Realizar el mismo cambio en  el runner de xcode en ios
10. Instalar "firebase_core" mediante el Pub Assist
11. Ejecutar el comando dart pub global activate flutterfire_cli  en la terminal de de visual studio code dentro de la carpeta del proyecto
12. Seguido de eso, ejecutar el comando "flutterfire configure" y seguir los pasos de confiduración

Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
android   1:962893283717:android:5e12568ddd6b65380dc4ec
ios       1:962893283717:ios:9f717f1934e87f820dc4ec

13. En nuestro bloc, creamos un método estatico para inicializar Firebase y lo llamamos desde nuestro Main



Push App
Importante:
Deben de crear su proyecto de Firebase
Configurarlo en Flutter, revisar:
firebase.flutter.dev/docs