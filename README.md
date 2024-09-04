# Mobile - Rotar matriz en sentido horario 

## Requerimientos

En el sgt documento se encuentran los  [Requerimientos](https://docs.google.com/document/d/1IYL7RI4SewwJbJ5wVkcCT5E7Tjgs3Gj-/edit?usp=sharing&ouid=109397545045871326330&rtpof=true&sd=true)

Los recursos se encuentran en el siguiente enlace de  [Recursos](https://drive.google.com/drive/folders/1UL6pTvqsONt4LAZ30npSxJxE7drAgCQf?usp=sharing) donde podrá encontrar el APK y las imágenes que se muestran a continuación.

## Liberias utilizadas 🛠️

_Al ser un proyecto pequeño, utilicé sólo lo necesario_

* [Go Router](https://pub.dev/packages/go_router) - Para organizar las rutas
* [Flutter Bloc](https://pub.dev/packages/flutter_bloc) - Usado para generar RSS
* [Equatable](https://pub.dev/documentation/equatable/latest/) - Para evitar el boilerplate en el código, y testing
* [Bloc Test](https://pub.dev/packages/bloc_test) - Para realizar el testing de la capa de aplicación


## Criterios de aceptación ✅

* Se debe rotar la matriz NxN:</br>

[![Watch the video](https://drive.google.com/uc?export=view&id=11X_c-yZMOIm4MA2I4NISPmK_-hRIoddR)](https://drive.google.com/file/d/16-H36de8YmqWm-nG9VmfNeIRKlnRRHpZ/view?usp=sharing)


* Separar la vista de la lógica de la aplicación:</br>
_Creé dos capas, lo explico a continuación_


* Usar algún paquete de gestión de estado (no usar la gestión nativa setState()):</br>
_Para este propósito usamos Bloc_

* Se considerarán las buena prácticas y estándares de programación: </br>_Ya que no tenemos conexiones ni entidades no creamos otras capas que no son necesarias por el momento, sólo la capa de aplicación donde tenemos la lógica y la capa de presentación._</br>


![Estructura de carpetas](https://drive.google.com/uc?export=view&id=1Qa759qqdECj4Y9M5OxLssog3CVtn2GVT)

* Al rotar la matriz se debe mostrar un mensaje tipo toast con el valor anterior de la matriz este toast no debe ser una libreria de flutter. Puede ser una libreria de android y un pod de ios.</br>
_Para este proposito usé scaffoldMessenger, es una librería nativa de Flutter, de la siguiente manera_</br>

![Snackbar](https://drive.google.com/uc?export=view&id=16N6LAI8OCc_CdznR3xDQDjGGRQzI8hV-)


* Se incluye también el unit testing del bloc</br>

![Unit Testing Estructure](https://drive.google.com/uc?export=view&id=1qvZn353Y6nJT86AgVIyvror1n0LVcMit)




