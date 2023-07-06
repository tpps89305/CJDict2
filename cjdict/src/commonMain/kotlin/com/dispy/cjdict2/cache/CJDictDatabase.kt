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

    fun selectAllSaves(): List<Save> {
        return dbQuery.selectAllSaves().executeAsList()
    }

    fun selectAllRecents(): List<String> {
        return dbQuery.selectAllRecents().executeAsList().map { cangWord -> cangWord.data_ }
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

    fun deleteOldRecents(amountRecent: Int) {
        val lastId = getLastInsertId() - amountRecent
        dbQuery.deleteRecentsLessThenId(lastId)
    }

    fun getLastInsertId(): Long {
        return dbQuery.selectAllRecents().executeAsList().last()._id
    }
}