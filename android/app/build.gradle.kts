plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // Flutter Gradle plugin must be applied after Android and Kotlin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.dp_maker"
    compileSdk = 36
    ndkVersion = "27.0.12077973" // optional, only if you use native libs

        defaultConfig {
        applicationId = "com.example.dp_maker"
        minSdk = maxOf(24, flutter.minSdkVersion) // ensure min 24 for new plugins
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

buildTypes {
    getByName("debug") {
        // Debug builds shouldn't shrink resources or code
        isMinifyEnabled = false
        isShrinkResources = false
    }

    getByName("release") {
        // You can enable these later for smaller builds
        isMinifyEnabled = false
        isShrinkResources = false
        signingConfig = signingConfigs.getByName("debug")
    }
}

    buildFeatures {
        viewBinding = true
    }
}

flutter {
    source = "../.."
}
