package com.uti.bjmservice.model.rajaongkir

import com.uti.bjmservice.model.ModelAlamat

class ResponOngkir {
    val rajaongkir = Rajaongkir()

    class Rajaongkir {
        val results = ArrayList<Result>()
    }
}