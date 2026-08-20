# ZHYRAVEX Android - migración Gradle

Esta es la primera migración real del proyecto Android antiguo de ZHYRAVEX desde Ant/Visual Studio Android hacia Gradle + CMake + Android NDK.

## Ya migrado

- Gradle Android Application Plugin
- `compileSdk 34`, `targetSdk 34`, `minSdk 21`
- Java `OTClientV8` integrado
- recursos Android e iconos originales integrados
- `NativeActivity` corregida para Android moderno (`android:exported=true`)
- orientación horizontal e immersive mode preservados
- C++ real del cliente copiado desde el ZIP original
- CMake genera `libotclientv8.so`
- ABIs configuradas: `arm64-v8a` y `armeabi-v7a`
- workflow de GitHub Actions preparado para compilar sin depender del PC local

## Compatibilidad JNI

Por ahora se conserva `com.otclientv8` porque `src/framework/platform/androidwindow.cpp` exporta `Java_com_otclientv8_OTClientV8_commitText`. El cambio a `com.zhyravex.client` debe hacerse simultáneamente en Java, Manifest y C++.

## Lo que falta antes de obtener un APK funcional

1. Reconstruir o conseguir las bibliotecas NDK externas listadas en `third_party/README.md`.
2. Colocar/crear `app/src/main/assets/data.zip` con los recursos del juego.
3. Ejecutar `:app:assembleDebug` y resolver incompatibilidades del código C++ antiguo con el NDK moderno, si aparecen.
4. Una vez que arranque, renombrar paquete a `com.zhyravex.client` y firmar Release.

## Compilación en nube

El archivo `.github/workflows/build-android.yml` instala Java, Android SDK, NDK y CMake automáticamente. Cuando las dependencias nativas estén incluidas, GitHub puede producir el APK sin instalar compiladores en tu PC.
