package com.example.cryptowatch.model

import android.graphics.Movie
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class CryptoViewModel: ViewModel() {
    val cryptoList = MutableLiveData<ArrayList<Crypto>>()

    fun updateList(newList: ArrayList<Crypto>){
        cryptoList.value = newList
    }
}