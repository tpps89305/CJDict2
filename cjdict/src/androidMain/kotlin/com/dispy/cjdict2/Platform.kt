package com.dispy.cjdict2

actual class Platform actual constructor() {
    actual val platform: String = "Android ${android.os.Build.VERSION.SDK_INT}"
}