package com.xiangbo.flutter_news_app

import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.util.ViewUtils

class MainActivity: FlutterActivity() {

    private val CHANNEL = "helloworld.flutter.io/info"

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        flutterEngine?.let { GeneratedPluginRegistrant.registerWith(it) }

    }




}
