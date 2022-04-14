package com.example.cryptowatch.util

import android.content.Context
import android.util.Log
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.android.volley.Request
import com.example.cryptowatch.model.Crypto
import com.example.cryptowatch.model.CryptoViewModel
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject

class JSONdata {
    fun loadJSON(context: Context, cryptoViewModel: CryptoViewModel){
        Log.d("Getting in loadJSON", "OK")
        val url = "https://api.nomics.com/v1/currencies/ticker?key=1512e707221b35b503a344199a23276575f40df5"
        val queue = Volley.newRequestQueue(context)
        val request = StringRequest(Request.Method.GET, url,
            { response ->
                parseJSON(response, cryptoViewModel)
            },
            {
                Log.e("RESPONSE", "request failed")
            }
        )
        queue.add(request)
    }

    fun parseJSON(response: String, cryptoViewModel: CryptoViewModel){
        val dataList = ArrayList<Crypto>()
        Log.d("Getting in parseJSON", "OK")
        try {
            val resultsArray = JSONArray(response) //JSONObject(response)

//            val resultsArray = jsonArray.getJSONArray(0)  //.getJSONArray("")

            for (i in 0 until resultsArray.length()){
                val cryptoObject = resultsArray.getJSONObject(i)
                //get values
                val id = cryptoObject.getString("id")
                Log.d("Results from API",id)
                val currency = cryptoObject.getString("currency")
                val price = cryptoObject.getString("price")
                val logo_url = cryptoObject.getString("logo_url")

                //create new crypto objecct
                val newCrypto =  Crypto(id, currency, price, logo_url)

                //add character object to our ArrayList
                dataList.add(newCrypto)
            }
        } catch (e: JSONException){
            e.printStackTrace()
        }
        cryptoViewModel.updateList(dataList)
    }
}