package com.dispy.cjdict2.cache

/**
 * Created by Dispy-Yang on 2023/4/20.
 *
 * @author yangchaofu
 * @since 2023/4/20
 */
class CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = AppDatabase(databaseDriverFactory.createDriver())
    private val dbQuery = database.appDatabaseQueries

    fun insertSave(data: String) {
        dbQuery.insertSave(data)
    }

    fun insertRecent(data: String) {
        dbQuery.insertRecent(data)
    }

    fun selectAllSaves(): List<String> {
        return dbQuery.selectAllSaves().executeAsList()
    }

    fun selectAllRecents(): List<String> {
        return dbQuery.selectAllRecents().executeAsList()
    }

    fun isDataSaved(dataToCheck: String): Boolean {
        val result = dbQuery.selectSaveByData(dataToCheck).executeAsList()
        return result.isNotEmpty()
    }

    fun removeAllSaves() {
        dbQuery.removeAllSaves()
    }

    fun removeAllRecents() {
        dbQuery.removeAllRecents()
    }

    fun deleteSaveById(id: Long) {
        dbQuery.deleteSaveById(id)
    }

    fun deleteRecentsLessThenId(id: Long) {
        dbQuery.deleteRecentsLessThenId(id)
    }
}