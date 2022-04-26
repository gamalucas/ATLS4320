package com.example.countries

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.countries.model.ItemViewModel
import com.google.android.material.snackbar.Snackbar

class MyListAdapter(private val itemViewModel: ItemViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    private var myItemList = itemViewModel.itemList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val itemTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val item = myItemList?.get(position)
        holder.itemTextView.text = item?.name ?: ""
        holder.itemView.setOnCreateContextMenuListener(){menu, view, menuInfo ->
            menu.setHeaderTitle(R.string.delete)

            menu.add(R.string.yes).setOnMenuItemClickListener {
                itemViewModel.delete(item!!)
                Snackbar.make(view, R.string.deleteItem, Snackbar.LENGTH_LONG)
                    .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }
    }

    override fun getItemCount(): Int {
        if (myItemList != null) {
            return myItemList!!.size
        } else return 0
    }

    fun update(){
        myItemList = itemViewModel.itemList.value
        notifyDataSetChanged()
    }
}
