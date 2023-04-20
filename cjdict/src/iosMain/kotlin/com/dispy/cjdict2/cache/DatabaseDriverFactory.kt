package com.dispy.cjdict2.cache

import com.squareup.sqldelight.db.SqlDriver
import com.squareup.sqldelight.drivers.native.NativeSqliteDriver

/**
 * Created by Dispy-Yang on 2023/4/20.
 *
 * @author yangchaofu
 * @since 2023/4/20
 */
actual class DatabaseDriverFactory {
    actual fun createDriver(): SqlDriver {
        return NativeSqliteDriver(AppDatabase.Schema, "test.db")
    }
}