package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2022/05/28
 *
 * @author Dispy-Yang
 * @since 2022/5/28
 */
class CangJi3Dict(cjchar: String, cjcode: String, cjroot: String) : CangJiDict() {
    init {
        cjChar = cjchar.split(",") as ArrayList<String>
        cjCode = cjcode.split(",") as ArrayList<String>
        cjRoot = cjroot.split(",") as ArrayList<String>
    }
}