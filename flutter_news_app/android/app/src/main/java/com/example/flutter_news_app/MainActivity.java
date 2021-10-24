package com.example.flutter_news_app;

import android.os.Bundle;
import android.os.ConditionVariable;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private final String CHANNEL = "helloworld.flutter.io/MethodChannel";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegister.registerGeneratedPlugins(getFlutterEngine());

        DartExecutor dartExecutor = this.getFlutterEngine().getDartExecutor();

        MethodChannel methodChannel = new MethodChannel( dartExecutor, CHANNEL);

        methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if (call.method.equals("getInfomationFromNative")) {
                    result.success("value from android");
                } else if (call.method.equals("toast")) {
                    String arguments = (String) call.arguments;
                    Log.e("MainActivity", "onMethodCall: " + arguments);
                    Toast.makeText(getContext(), arguments, Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
