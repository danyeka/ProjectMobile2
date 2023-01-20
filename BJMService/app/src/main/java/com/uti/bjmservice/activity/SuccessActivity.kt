package com.uti.bjmservice.activity

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.google.gson.Gson
import com.uti.bjmservice.MainActivity
import com.uti.bjmservice.R
import com.uti.bjmservice.helper.Helper
import com.uti.bjmservice.model.Bank
import com.uti.bjmservice.model.Chekout
import com.uti.bjmservice.model.Transaksi
import com.uti.bjmservice.room.MyDatabase
import kotlinx.android.synthetic.main.activity_success.*
import kotlinx.android.synthetic.main.toolbar_custom.*

@Suppress("DEPRECATION", "OVERRIDE_DEPRECATION")
class SuccessActivity : AppCompatActivity() {

    var nominal = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_success)
        Helper().setToolbar(this,toolbar, "Bank Transfer")

        setValues()
        mainButton()
    }


    fun mainButton(){
        btn_copyNoRek.setOnClickListener {
        copyText(tv_nomorRekening.text.toString())
        }

        btn_copyNominal.setOnClickListener {
            copyText(nominal.toString())
        }
        btn_cekStatus.setOnClickListener {
            startActivity(Intent(this,RiwayatActivity::class.java))
        }
    }


    fun copyText(text:String){
        val copyManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        val copyText = ClipData.newPlainText("text",text)
        copyManager.setPrimaryClip(copyText)

        Toast.makeText(this, "Text Berhasil di Copy", Toast.LENGTH_LONG).show()
    }

    fun setValues(){
       val jsBank =  intent.getStringExtra("bank")
       val jsTransaksi = intent.getStringExtra("transaksi")
        val jsCheckout = intent.getStringExtra("chekout")

        val bank = Gson().fromJson(jsBank, Bank::class.java)
        val transaksi = Gson().fromJson(jsTransaksi, Transaksi::class.java)
        val chekout = Gson().fromJson(jsCheckout, Chekout::class.java)

        // hapus keranjang
        val myDb = MyDatabase.getInstance(this)!!
        for (produk in chekout.produks){
            myDb.daoKeranjang().deleteById(produk.id)
        }

        tv_nomorRekening.text = bank.rekening
        tv_namaPenerima.text = bank.penerima
        image_bank.setImageResource(bank.image)

        nominal =Integer.valueOf(transaksi.total_transfer) + transaksi.kode_unik
        tv_nominal.text =Helper().gantiRupiah(nominal)
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return super.onSupportNavigateUp()
    }


    override fun onBackPressed() {
        val intent = Intent(this, MainActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
        finish()
        super.onBackPressed()
    }
}