plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    compileSdk = 35
    defaultConfig {
        applicationId = "dispy.tool.cangjiedict"
        minSdk = 24
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
        }
    }
    namespace = "com.dispy.cjdict2.android"
}

dependencies {
    implementation(project(":cjdict"))
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
}