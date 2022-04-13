package com.example.cryptowatch

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.cryptowatch.model.CryptoViewModel
import com.example.cryptowatch.util.JSONdata

class MainActivity : AppCompatActivity() {
    private val viewModel: CryptoViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (viewModel.cryptoList.value == null){
            val loader = JSONdata()
            loader.loadJSON(this.applicationContext, viewModel)
        }

        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        val adapter = MyListAdapter(viewModel)

        recyclerView.adapter = adapter

        viewModel.cryptoList.observe(this, Observer {
            adapter.update()
        })
    }
}