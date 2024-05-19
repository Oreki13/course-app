# Course App

Build APK : [Drive](https://drive.google.com/file/d/1ZCkYAX-Sc_uaCPx5ESA2VpWf2lom4377/view?usp=sharing)

## Persyaratan

- Dart 3.3 atau lebih tinggi
- Flutter 3.19 atau lebih tinggi

## Instruksi Instalasi

1. Jalankan di terminal `flutter pub get`
2. Ganti nama file `/lib/core/configs/app_config_example.dart` menjadi `app_config.dart` dan ubah

```text
class AppConfig {
  static String baseUrl = "https://change_to_your_domain.com";
}
```

3. Jalankan `flutter run`

## Teknologi yang di gunakan

1. BLoC sebagai State Management
2. AutoRoute sebagai Routing
3. Get_it sebagai Dependency Injection
4. Clean Architecture
