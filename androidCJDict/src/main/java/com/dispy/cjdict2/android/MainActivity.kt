package com.dispy.cjdict2.android

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.dispy.cjdict2.CangJi3Dict
import com.dispy.cjdict2.CangJi5Dict

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 倉頡第三代
        val dict = CangJi3Dict()

        // 倉頡第五代
        val dict5 = CangJi5Dict()

        val editText: EditText = findViewById(R.id.editText)
        val button: Button = findViewById(R.id.button)

        val tv: TextView = findViewById(R.id.textView)

        button.setOnClickListener {
            tv.text = dict5.getCangJiCode(editText.editableText.toString()).first().root
        }
    }
}
