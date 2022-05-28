package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2022/05/28
 *
 * @author Dispy-Yang
 * @since 2022/5/28
 */
class CangJi5Dict(cj5Origin: Array<String>, cjroot: String) : CangJiDict() {
    init {
        cjCode = ArrayList()
        cjChar = ArrayList()
        for (eachRow in cj5Origin) {
            val temp = eachRow.split(" ")
            cjCode.add(temp[0])
            cjChar.add(temp[1])
        }
        cjRoot = cjroot.split(",") as ArrayList<String>
    }
}