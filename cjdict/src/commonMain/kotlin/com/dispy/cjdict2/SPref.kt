package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2023/4/19.
 *
 * @author yangchaofu
 * @since 2023/4/19
 */

expect class SPref

expect fun SPref.getBool(key: String): Boolean
expect fun SPref.setBool(key: String, value: Boolean)