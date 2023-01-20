package com.uti.bjmservice.activity

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.gson.Gson
import com.ontbee.legacyforks.cn.pedant.SweetAlert.SweetAlertDialog
import com.uti.bjmservice.R
import com.uti.bjmservice.adapter.AdapterBank
import com.uti.bjmservice.app.ApiConfig
import com.uti.bjmservice.helper.Helper
import com.uti.bjmservice.model.Bank
import com.uti.bjmservice.model.Chekout
import com.uti.bjmservice.model.ResponModel
import com.uti.bjmservice.model.Transaksi
import kotlinx.android.synthetic.main.activity_pembayaran.*
import kotlinx.android.synthetic.main.toolbar_custom.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

@Suppress("DEPRECATION")
class PembayaranActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pembayaran)
        Helper().setToolbar(this,toolbar, "Pembayaran")

        displayBank()
    }

    fun displayBank(){
        val arrBank = ArrayList<Bank>()
        arrBank.add(Bank("BCA", "356594332", "Dany Eka Saputra", R.drawable.logo_bca))
        arrBank.add(Bank("BRI", "465468686", "Dany Eka Saputra", R.drawable.logo_bri))
        arrBank.add(Bank("MANDIRI", "36564879", "Dany Eka Saputra", R.drawable.logo_madiri))

        val layoutManager = LinearLayoutManager(this)
        layoutManager.orientation = LinearLayoutManager.VERTICAL

        rv_data.layoutManager = layoutManager
        rv_data.adapter = AdapterBank(arrBank, object :AdapterBank.Listeners{
            override fun onClicked(data: Bank, index: Int) {
                bayar(data)
            }

        })
    }

    @SuppressLint("SuspiciousIndentation")
    fun bayar(bank: Bank){

        val json = intent.getStringExtra("extra")!!.toString()
        val chekout = Gson().fromJson(json, Chekout::class.java)
        chekout.bank = bank.nama

        val loading =  SweetAlertDialog(this, SweetAlertDialog.PROGRESS_TYPE)
        loading.setTitleText("Loading...").show()

                ApiConfig.instanceRetrofit.chekout(chekout).enqueue(object : Callback<ResponModel> {
            override fun onFailure(call: Call<ResponModel>, t: Throwable) {
                loading.dismiss()
                error(t.message.toString())
//                Toast.makeText(this@PengirimanActivity, "Error:" + t.message, Toast.LENGTH_SHORT).show()
            }

            override fun onResponse(call: Call<ResponModel>, response: Response<ResponModel>) {
                loading.dismiss()
                if (!response.isSuccessful){
                    error(response.message())
                    return
                }

                val respon = response.body()!!
                if (respon.success == 1) {

                    val jsBank = Gson().toJson(bank, Bank::class.java)
                    val jsTransaksi = Gson().toJson(respon.transaksi, Transaksi::class.java)
                    val jsChekout = Gson().toJson(chekout, Chekout::class.java)

                 val intent = Intent(this@PembayaranActivity, SuccessActivity::class.java)
                 intent.putExtra("bank", jsBank)
                 intent.putExtra("transaksi", jsTransaksi)
                 intent.putExtra("chekout", jsChekout)
                 startActivity(intent)

                } else {
                    error(respon.message)
                    Toast.makeText(this@PembayaranActivity, "Error:" + respon.message, Toast.LENGTH_SHORT).show()
                }
            }
        })
    }

    fun error(pesan:String){
        SweetAlertDialog(this, SweetAlertDialog.ERROR_TYPE)
            .setTitleText("Oops...")
            .setContentText(pesan)
            .show()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return super.onSupportNavigateUp()
    }
}