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

# Para recibir notificaciones via Api Rest se debe hacer lo siguiente. 
1. levantar el servidor de node para obtener el Bearer Token 
2. desde postman hacer la petición a localhost:3000

## En el nuevo endpoint
https://fcm.googleapis.com/v1/projects/<<ID del proyecto>>/messages:send
El Id del proyecto se obtiene en firebase, engranaje, configuración del proyecto
3. copiar el token recibido y pegarlo en Authorization Bearer Token
4. En el body ponemos el json de la petición tipo post que vamos a enviar:
{
   "message":{
      "token":"di6qzkAASqOQ3_wgy4Z4mC:APA91bHyQNiiDgbTTmaO4n17xE_0v6HmmjfOhzIUjiFTvh-7bu5RPvA6ygBnXmZ-dGU1KIh03zAnY711Tsp3LFghY-snnyMRMWiEAC5lHZ0unm63Qjnfvwf1oLxls6eY1euvHk0As3CM",
      "data":{},
      "notification":{
        "title":"FCM Message",
        "body":"This is an FCM notification message!"
      }
   }
}

5. Debemos verificar que la app en el emulador esté corriendo.
6. Debemos recibir una confirmación de este tipo.
{
    "name": "projects/app-notifications-flutte-8bdfd/messages/0:1725451046530444%47bfbbff47bfbbff"
}