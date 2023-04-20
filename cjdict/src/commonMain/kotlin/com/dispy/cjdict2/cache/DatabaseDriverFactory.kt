package com.dispy.cjdict2.cache

import com.squareup.sqldelight.db.SqlDriver

/**
 * Created by Dispy-Yang on 2023/4/20.
 *
 * @author yangchaofu
 * @since 2023/4/20
 */
expect class DatabaseDriverFactory {
    fun createDriver(): SqlDriver
}