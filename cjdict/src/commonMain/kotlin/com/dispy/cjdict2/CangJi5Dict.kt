package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2022/05/28
 *
 * @author Dispy-Yang
 * @since 2022/5/28
 */
class CangJi5Dict : CangJiDict() {
    init {
        cjRoot = cjCodeData.split(",") as ArrayList<String>
        cjDict = hashMapOf()
        for (eachRow in cj5DictData.split("\n")) {
            val dictKey = eachRow.split(",")[0]
            val dictValue = eachRow.split(",")[1]
            cjDict[dictKey] = dictValue
        }
    }
}