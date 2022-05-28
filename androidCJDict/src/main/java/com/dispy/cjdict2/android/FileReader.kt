package com.dispy.cjdict2.android

import android.content.Context
import java.io.BufferedReader
import java.io.InputStream
import java.io.InputStreamReader

/**
 * Created by Dispy-Yang on 2022/05/28
 *
 * @author Dispy-Yang
 * @since 2022/5/28
 */
class FileReader {
    companion object {
        fun loadFile(context: Context, rawId: Int): String {
            val inputStream: InputStream = context.resources.openRawResource(rawId)
            val inputStreamReader = InputStreamReader(inputStream)
            val bufferedReader = BufferedReader(inputStreamReader)
            return bufferedReader.use { it.readText() }
        }
    }
}