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

actual fun SPref.getInt(key: String): Int {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    return prefs.getInt(key, 0)
}

actual fun SPref.setInt(key: String, value: Int) {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    val editor = prefs.edit()
    editor.putInt(key, value)
    editor.apply()
}

actual fun SPref.getString(key: String): String {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    return prefs.getString(key, "") ?: ""
}

actual fun SPref.setString(key: String, value: String) {
    val prefs: SharedPreferences = this.getSharedPreferences(SettingHandlerTag.TAG_SETTING, MODE_PRIVATE)
    val editor = prefs.edit()
    editor.putString(key, value)
    editor.apply()
}