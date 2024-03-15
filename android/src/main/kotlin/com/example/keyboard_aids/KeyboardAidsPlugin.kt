package com.example.keyboard_aids

import androidx.annotation.NonNull
import android.app.Activity
import android.view.WindowManager

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** KeyboardAidsPlugin */
class KeyboardAidsPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  private var activity: Activity? = null
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "keyboard_aids")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    var name = call.method;
    if (name == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(name == "open"){
      activity?.window?.addFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM)
      result.success("open")
    } else if(name == "close"){
      activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM)
      result.success("close")
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(activityPluginBinding: ActivityPluginBinding) {
    activity = activityPluginBinding.activity
    // 现在你可以使用 activity 变量访问当前界面的 FlutterActivity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // 处理配置变化时的逻辑...
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    // 重新附加到 Activity 后的逻辑...
  }

  override fun onDetachedFromActivity() {
    activity = null
    // 处理 Activity 分离的逻辑...
  }
}
