package com.uti.bjmservice.activity

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.gson.Gson
import com.ontbee.legacyforks.cn.pedant.SweetAlert.SweetAlertDialog
import com.uti.bjmservice.R
import com.uti.bjmservice.adapter.AdapterProdukTransaksi
import com.uti.bjmservice.app.ApiConfig
import com.uti.bjmservice.helper.Helper
import com.uti.bjmservice.model.DetailTransaksi
import com.uti.bjmservice.model.ResponModel
import com.uti.bjmservice.model.Transaksi
import kotlinx.android.synthetic.main.activity_detail_transaksi.*
import kotlinx.android.synthetic.main.activity_riwayat.*
import kotlinx.android.synthetic.main.toolbar.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response


@Suppress("DEPRECATION")
class DetailTransaksiActivity : AppCompatActivity() {

    var transaksi = Transaksi()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail_transaksi)
        Helper().setToolbar(this, toolbar, "Detail Transaksi")

        val json = intent.getStringExtra("transaksi")
         transaksi = Gson().fromJson(json, Transaksi::class.java)

        setData(transaksi)
        displayProduk(transaksi.details)
        mainButton()
    }

    fun mainButton(){
        btn_batal.setOnClickListener {

            SweetAlertDialog(this, SweetAlertDialog.WARNING_TYPE)
                .setTitleText("Apakah anda yakin?")
                .setContentText("Transaksi akan di batalkan dan tidak bisa di kembalikan")
                .setConfirmText("Ya, batalkan!")
                .setConfirmClickListener {
                    it.dismissWithAnimation()
                    batalTransaksi()
                }
                .setCancelText("Tutup")
                .setCancelClickListener {
                    it.dismissWithAnimation()
                }.show()
        }
    }


    fun batalTransaksi(){

       val loading =  SweetAlertDialog(this@DetailTransaksiActivity, SweetAlertDialog.PROGRESS_TYPE)
        loading.setTitleText("Loading...").show()

        ApiConfig.instanceRetrofit.batalChekout(transaksi.id).enqueue(object: Callback<ResponModel> {
            override fun onFailure(call: Call<ResponModel>, t: Throwable) {
                loading.dismiss()
                error(t.message.toString())
            }

            override fun onResponse(call: Call<ResponModel>, response: Response<ResponModel>) {
                loading.dismiss()
                val res = response.body()!!
                if (res.success == 1 ){
                    SweetAlertDialog(this@DetailTransaksiActivity, SweetAlertDialog.SUCCESS_TYPE)
                        .setTitleText("Success...")
                        .setContentText("Transaksi Berhasil dibatalkan")
                        .setConfirmClickListener {
                            it.dismissWithAnimation()
                            onBackPressed()
                        }.show()
//                    Toast.makeText(this@DetailTransaksiActivity,"Transaksi berhasil di Bataalkan", Toast.LENGTH_SHORT).show()
//
//                //  displayRiwayat(res.transaksis)
                }else{
                    error(res.message)
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


    @SuppressLint("SetTextI18n")
    fun setData(t: Transaksi) {
        tv_status.text = t.status

        val formatBaru = "dd MMMM yyyy, kk:mm:ss"
        tv_tgl.text = Helper().convertTanggal(t.created_at, formatBaru)

        tv_penerima.text = t.name + " - " + t.phone
        tv_alamat.text = t.detail_lokasi
        tv_kodeUnik.text = Helper().gantiRupiah(t.kode_unik)
        tv_totalBelanja.text = Helper().gantiRupiah(t.total_harga)
        tv_ongkir.text = Helper().gantiRupiah(t.ongkir)
        tv_total.text = Helper().gantiRupiah(t.total_transfer)

        if (t.status != "MENUNGGU") div_footer.visibility = View.GONE

        var color = getColor(R.color.menungu)
        if (t.status == "SELESAI") color = getColor(R.color.selesai)
        else if (t.status == "BATAL") color = getColor(R.color.batal)

        tv_status.setTextColor(color)
    }

    fun displayProduk(transaksis: ArrayList<DetailTransaksi>) {


        val layoutManager = LinearLayoutManager(this)
        layoutManager.orientation = LinearLayoutManager.VERTICAL

        rv_produk.adapter = AdapterProdukTransaksi(transaksis)
        rv_produk.layoutManager = layoutManager
    }



    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return super.onSupportNavigateUp()
    }

}