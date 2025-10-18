# 📱 Mobile - Rotar Matriz en Sentido Horario

## 📋 Requerimientos

En el siguiente documento se detallan los [Requerimientos](https://docs.google.com/document/d/1IYL7RI4SewwJbJ5wVkcCT5E7Tjgs3Gj-/edit?usp=sharing&ouid=109397545045871326330&rtpof=true&sd=true).  

Los recursos están disponibles en [Google Drive](https://drive.google.com/drive/folders/1UL6pTvqsONt4LAZ30npSxJxE7drAgCQf?usp=sharing), donde se pueden encontrar el APK y las imágenes mostradas a continuación.  

La versión de Flutter utilizada es **3.19.3**.

---

## 🛠️ Librerías utilizadas

_Al ser un proyecto pequeño, se utilizaron sólo las librerías necesarias:_

- [Go Router](https://pub.dev/packages/go_router): Para la organización de rutas  
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc): Usado para la gestión del estado de la aplicación  
- [Equatable](https://pub.dev/documentation/equatable/latest/): Para reducir el boilerplate en la comparación de objetos y facilitar testing  
- [Bloc Test](https://pub.dev/packages/bloc_test): Para realizar pruebas unitarias sobre la capa de aplicación

---

## ✅ Criterios de aceptación

### 1. Rotar la matriz NxN
Al presionar el botón correspondiente, la matriz debe rotarse en sentido horario.

[![Ver video](https://drive.google.com/uc?export=view&id=11X_c-yZMOIm4MA2I4NISPmK_-hRIoddR)](https://drive.google.com/file/d/16-H36de8YmqWm-nG9VmfNeIRKlnRRHpZ/view?usp=sharing)

---

### 2. Separar la vista de la lógica de la aplicación
Se implementaron dos capas principales:
- **Capa de presentación (UI)**
- **Capa de aplicación (lógica y estado)**

Esta separación permite mantener el código limpio, escalable y fácil de testear.

---

### 3. Gestión de estado
En lugar de usar `setState()`, se utilizó **Bloc** para controlar el flujo de eventos y estados, asegurando una arquitectura más sólida y mantenible.

---

### 4. Buenas prácticas y estándares de programación
Debido a que el proyecto no tiene conexión con API ni entidades externas, no se añadieron capas innecesarias.  
Se mantuvo una estructura simple con las capas **de aplicación** y **de presentación**, suficiente para el alcance actual.

![Estructura de carpetas](https://drive.google.com/uc?export=view&id=1Qa759qqdECj4Y9M5OxLssog3CVtn2GVT)

---

### 5. Mostrar mensaje tipo Toast (sin librería externa)
Se utilizó **ScaffoldMessenger**, una librería nativa de Flutter, para mostrar el valor anterior de la matriz cada vez que se rota.

![Snackbar](https://drive.google.com/uc?export=view&id=16N6LAI8OCc_CdznR3xDQDjGGRQzI8hV-)

---

### 6. Unit Testing del Bloc
Se implementaron pruebas unitarias para validar la lógica del Bloc y garantizar que los estados se actualicen correctamente ante diferentes eventos.

![Estructura de testing](https://drive.google.com/uc?export=view&id=1qvZn353Y6nJT86AgVIyvror1n0LVcMit)

---

## 👨‍💻 Autor

**Luis Aguilar Rojas**  
Full Stack Engineer (Mobile Focused)  
[LinkedIn](https://linkedin.com/in/luis-angel-developer) • [GitHub](https://github.com/ElMopendor)
