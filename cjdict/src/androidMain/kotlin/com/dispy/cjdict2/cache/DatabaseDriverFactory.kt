package com.dispy.cjdict2.cache

import android.content.Context
import com.squareup.sqldelight.android.AndroidSqliteDriver
import com.squareup.sqldelight.db.SqlDriver

/**
 * Created by Dispy-Yang on 2023/4/20.
 *
 * @author yangchaofu
 * @since 2023/4/20
 */
actual class DatabaseDriverFactory(private val context: Context) {
    actual fun createDriver(): SqlDriver {
        return AndroidSqliteDriver(AppDatabase.Schema, context, "main.db")
    }
}