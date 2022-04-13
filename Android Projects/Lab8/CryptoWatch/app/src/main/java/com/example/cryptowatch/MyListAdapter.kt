package com.example.cryptowatch

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.cryptowatch.model.CryptoViewModel
import com.squareup.picasso.Picasso

class MyListAdapter(private val cryptoViewModel: CryptoViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    private var myCryptoList = cryptoViewModel.cryptoList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val titleTextView: TextView = view.findViewById(R.id.titleTextView)
        val priceTextView: TextView = view.findViewById(R.id.priceTextView)
        val imageView: ImageView = view.findViewById(R.id.imageView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyListAdapter.ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.card_list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: MyListAdapter.ViewHolder, position: Int) {
        val crypto = myCryptoList?.get(position)
        holder.titleTextView.text = crypto?.currency ?: ""
        holder.priceTextView.text = "$" + crypto?.price ?: ""

        Picasso.get().load(crypto?.urlIcon ?: "").error(R.drawable.image_placeholder).placeholder(R.drawable.image_placeholder).into(holder.imageView);
    }

    override fun getItemCount(): Int {
       if (myCryptoList != null) {
           return myCryptoList!!.size
       }
        else return 0
    }

    fun update(){
        myCryptoList = cryptoViewModel.cryptoList.value
        notifyDataSetChanged()
    }
}