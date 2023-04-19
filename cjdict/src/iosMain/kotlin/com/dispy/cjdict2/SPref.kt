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