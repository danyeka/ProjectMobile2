package com.uti.bjmservice.activity

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.messaging.FirebaseMessaging
import com.uti.bjmservice.MainActivity
import com.uti.bjmservice.R
import com.uti.bjmservice.app.ApiConfig
import com.uti.bjmservice.helper.SharedPref
import com.uti.bjmservice.model.ResponModel
import kotlinx.android.synthetic.main.activity_masuk.btn_register
import kotlinx.android.synthetic.main.activity_register.*
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class RegisterActivity : AppCompatActivity() {

    lateinit var s: SharedPref
    lateinit var fcm:String
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_register)

        s = SharedPref(this)
        getFcm()

        btn_register.setOnClickListener {
            register()
        }

        btn_google.setOnClickListener {
            dataDummy()
        }
    }

    fun getFcm(){
        FirebaseMessaging.getInstance().token.addOnCompleteListener(OnCompleteListener { task ->
            if (!task.isSuccessful){
                Log.w("Respon", "Fetching FCM registration token failed", task.exception)
                return@OnCompleteListener
            }
            val token = task.result
            fcm =token.toString()

            Log.d("respon fcm:", token.toString())

        })
    }

    fun dataDummy() {
        edt_name.setText("Dany Eka Saputra")
        edt_email.setText("danyeka12@gmail.com")
        edt_phone.setText("08136670124012")
        edt_password.setText("12345678")
    }

    fun register() {
        if (edt_name.text!!.isEmpty()) {
            edt_name.error = "Kolom nama tidak boleh kosong"
            edt_name.requestFocus()
            return
        } else if (edt_email.text!!.isEmpty()) {
            edt_email.error = "Kolom email tidak boleh kosong"
            edt_email.requestFocus()
            return
        } else if (edt_phone.text!!.isEmpty()) {
            edt_phone.error = "Kolom handphone tidak boleh kosong"
            edt_phone.requestFocus()
            return
        } else if (edt_password.text!!.isEmpty()) {
            edt_password.error = "Kolom password tidak boleh kosong"
            edt_password.requestFocus()
            return
        }

        pb.visibility = View.VISIBLE
        ApiConfig.instanceRetrofit.register(edt_name.text.toString(),edt_email.text.toString(),edt_phone.text.toString(),
            edt_password.text.toString(),fcm).enqueue(object:Callback<ResponModel>{

            override fun onFailure(call: Call<ResponModel>, t: Throwable) {
                pb.visibility = View.GONE
                Toast.makeText(this@RegisterActivity, "Error:"+t.message, Toast.LENGTH_SHORT).show()
            }

            override fun onResponse(call: Call<ResponModel>, response: Response<ResponModel>) {
                pb.visibility = View.GONE
                val respon = response.body()?:ResponModel()

                if (respon.success == 200) {
                    s.setStatusLogin(true)
                    val intent = Intent(applicationContext, MainActivity::class.java)
                    startActivity(intent)
                    finish()
                    Toast.makeText(this@RegisterActivity, "Selamat datang " + respon.user.name, Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(this@RegisterActivity, "Error:" + respon.message, Toast.LENGTH_SHORT).show()
                }

        }
     })
    }
}