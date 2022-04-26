package com.example.countries

import io.realm.Realm
import io.realm.RealmConfiguration

class ListApplication: android.app.Application() {
    override fun onCreate() {
        super.onCreate()

        //start realm
        Realm.init(this)

        //define realm and its configuration
        val realmConfig  = RealmConfiguration.Builder().build()

        //set default real configuration
        Realm.setDefaultConfiguration(realmConfig )
    }
}