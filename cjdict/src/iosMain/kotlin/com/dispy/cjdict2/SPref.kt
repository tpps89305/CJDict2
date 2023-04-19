package com.dispy.cjdict2

import platform.Foundation.NSUserDefaults
import platform.darwin.NSObject

/**
 * Created by Dispy-Yang on 2023/4/19.
 *
 * @author yangchaofu
 * @since 2023/4/19
 */
actual typealias SPref = NSObject

actual fun SPref.getBool(key: String): Boolean {
    return NSUserDefaults.standardUserDefaults.boolForKey(key)
}

actual fun SPref.setBool(key: String, value: Boolean) {
    NSUserDefaults.standardUserDefaults.setBool(value, key)
}

actual fun SPref.getInt(key: String): Int {
    return NSUserDefaults.standardUserDefaults.integerForKey(key).toInt()
}

actual fun SPref.setInt(key: String, value: Int) {
    NSUserDefaults.standardUserDefaults.setInteger(value.toLong(), key)
}

actual fun SPref.getString(key: String): String {
    return NSUserDefaults.standardUserDefaults.stringForKey(key) ?: ""
}

actual fun SPref.setString(key: String, value: String) {
    NSUserDefaults.standardUserDefaults.setObject(value, key)
}