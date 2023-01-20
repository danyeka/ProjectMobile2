package com.uti.bjmservice.adapter

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.RadioButton
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.squareup.picasso.Picasso
import com.uti.bjmservice.R
import com.uti.bjmservice.helper.Helper
import com.uti.bjmservice.model.Alamat
import com.uti.bjmservice.model.DetailTransaksi
import com.uti.bjmservice.model.Produk
import com.uti.bjmservice.model.Transaksi
import com.uti.bjmservice.room.MyDatabase
import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.schedulers.Schedulers
import java.util.*
import kotlin.collections.ArrayList

class AdapterProdukTransaksi(var data : ArrayList<DetailTransaksi>) : RecyclerView.Adapter<AdapterProdukTransaksi.Holder>() {

    class Holder(view: View) : RecyclerView.ViewHolder(view) {
        val imgProduk = view.findViewById<ImageView>(R.id.img_produk)
        val tvNama = view.findViewById<TextView>(R.id.tv_nama)
        val tvHarga = view.findViewById<TextView>(R.id.tv_harga)
        val tvTotalHarga = view.findViewById<TextView>(R.id.tv_totalHarga)
        val tvJumlah = view.findViewById<TextView>(R.id.tv_jumlah)
        val layout = view.findViewById<CardView>(R.id.layout)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        val view: View = LayoutInflater.from(parent.context).inflate(R.layout.item_produk_transaksi, parent, false)
        return Holder(view)
    }

    override fun getItemCount(): Int {
        return data.size
    }

    @SuppressLint("SetTextI18n")
    override fun onBindViewHolder(holder: Holder, position: Int) {

        val a = data[position]

        val name = a.produk.name
        val p = a.produk

        holder.tvNama.text = name
        holder.tvHarga.text = Helper().gantiRupiah(p.harga)
        holder.tvTotalHarga.text = Helper().gantiRupiah(a.total_harga)
        holder.tvJumlah.text = a.total_item.toString() + " Items"


        holder.layout.setOnClickListener {
//            listener.onClicked(a)
        }

        val image =
            "http://192.168.2.16/tokoonline/storage/app/public/produk/" + p.image
        Picasso.get()
            .load(image)
            .placeholder(R.drawable.product)
            .error((R.drawable.product))
            .into(holder.imgProduk)
    }


    interface Listeners {
        fun onClicked(data: DetailTransaksi)
    }

}