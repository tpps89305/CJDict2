package com.dispy.cjdict2

import android.app.Activity
import android.content.Context.MODE_PRIVATE
import android.content.SharedPreferences

/**
 * Created by Dispy-Yang on 2023/4/19.
 *
 * @author yangchaofu
 * @since 2023/4/19
 */

actual typealias SPref = Activity

actual fun SPref.getBool(key: String) : Boolean {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    return prefs.getBoolean(key, false)
}

actual fun SPref.setBool(key: String, value: Boolean) {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    val editor = prefs.edit()
    editor.putBoolean(key, value)
    editor.apply()
}