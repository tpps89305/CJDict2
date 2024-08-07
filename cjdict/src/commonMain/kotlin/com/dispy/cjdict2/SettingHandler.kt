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

    fun setUseCangJi5(value: Boolean) {
        context.setBool(SettingHandlerTag.TAG_USE_CANG5, value)
    }

    fun getUseCangJi5(): Boolean {
        return context.getBool(SettingHandlerTag.TAG_USE_CANG5)
    }

    fun setRecentAmount(value: Int) {
        context.setInt(SettingHandlerTag.TAG_RECENT_AMOUNT, value)
    }

    fun getRecentAmount(): Int {
        val recent = context.getInt(SettingHandlerTag.TAG_RECENT_AMOUNT)
        if (recent <= 0) {
            return 10
        }
        return recent
    }

    fun setTheme(value: Int) {
        context.setInt(SettingHandlerTag.TAG_THEME, value)
    }

    fun getTheme(): Int {
        return context.getInt(SettingHandlerTag.TAG_THEME)
    }
}