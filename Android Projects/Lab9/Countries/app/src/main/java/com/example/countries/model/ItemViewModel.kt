package com.example.countries.model

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.example.countries.util.ItemDAO
import io.realm.RealmResults

open class ItemViewModel: ViewModel() {
    private val itemDAO = ItemDAO()
    val itemList: LiveData<RealmResults<Item>> = itemDAO.getItems()

    fun add(item: Item){
        itemDAO.addItem(item)
    }

    fun delete(item: Item){
        itemDAO.deleteItem(item.id)
    }

    fun deleteAll(){
        itemDAO.deleteAll()
    }

    override fun onCleared() {
        super.onCleared()
        itemDAO.close()
    }

}