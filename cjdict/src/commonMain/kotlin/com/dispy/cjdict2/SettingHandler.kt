package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2023/4/19.
 *
 * @author yangchaofu
 * @since 2023/4/19
 */
class SettingHandler(private val context: SPref) {
    fun setShowRoot(value: Boolean) {
        context.setBool(SettingHandlerTag.TAG_SHOW_ROOT, value)
    }

    fun getShowRoot(): Boolean {
        return context.getBool(SettingHandlerTag.TAG_SHOW_ROOT)
    }
}