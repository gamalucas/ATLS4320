package com.example.countries

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.EditText
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.countries.model.Item
import com.example.countries.model.ItemViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.util.*

class MainActivity : AppCompatActivity() {
    private val viewModel: ItemViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        val adapter = MyListAdapter(viewModel)
        recyclerView.adapter = adapter

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view ->
            val dialog = AlertDialog.Builder(this)
            val editText = EditText(applicationContext)
            dialog.setView(editText)
            dialog.setTitle(R.string.addItem)

            dialog.setPositiveButton(R.string.add) {dialog, which ->
                val newItem = editText.text.toString()
                if (!newItem.isEmpty()){
                    val newID = UUID.randomUUID().toString();
                    //add item
                    viewModel.add(Item(newID, newItem))
                    Snackbar.make(view, R.string.itemAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            dialog.setNegativeButton(R.string.cancel) { dialog, which ->
            }
            dialog.show()
        }

        viewModel.itemList.observe(this, Observer {
            adapter.update()
        })
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.options_menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_deleteAll -> {
                viewModel.deleteAll()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}