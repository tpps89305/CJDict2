package com.dispy.cjdict2

/**
 * Created by Dispy-Yang on 2022/05/28
 *
 * @author Dispy-Yang
 * @since 2022/5/28
 */
abstract class CangJiDict {
    lateinit var cjRoot: ArrayList<String>
    lateinit var cjDict: HashMap<String, String>

    open fun getCangJiCode(words: String): ArrayList<CangWord> {
        val rootArray = ArrayList<CangWord>()
        for (word in words) {
            val keyCode = getKeyCode(word.toString())
            val root = transToCangJiCode(keyCode)
            if (root.isNotEmpty()) {
                rootArray.add(CangWord(word.toString(), root, keyCode))
            }
        }
        return rootArray
    }

    /**
     * 取得欲查詢字元的英文按鈕。一次只接受輸入一個字元。
     *
     * @param word 欲查詢的字元（字句）
     * @return 查詢結果
     **/
     private fun getKeyCode(word: String): String {
        return if (word.length == 1) {
            cjDict[word].toString()
        } else {
            ""
        }
    }

    /**
     * 將英文按鍵轉換為中文倉頡碼
     *
     * @param keyCode 英文按鍵
     * @return 倉頡碼
     */
    private fun transToCangJiCode(keyCode: String): String {
        return if (keyCode.isNotEmpty()) {
            val root = StringBuilder()
            for (element in keyCode) {
                root.append(cjRoot[element.code - 97])
            }
            root.toString() //回傳對應的中文
        } else {
            ""
        }
    }
}