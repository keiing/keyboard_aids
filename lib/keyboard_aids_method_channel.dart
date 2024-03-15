import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'keyboard_aids_platform_interface.dart';

/// An implementation of [KeyboardAidsPlatform] that uses method channels.
class MethodChannelKeyboardAids extends KeyboardAidsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('keyboard_aids');

  @override
  Future<String?> open() async {
    String? value;
    try {
      if (Platform.isAndroid) {
        value = await methodChannel.invokeMethod<String>('open');
      } else {
        value = "true";
      }
    } catch (err) {
      value = "false";
    }
    return value;
  }

  @override
  Future<String?> close() async {
    String? value;
    try {
      if (Platform.isAndroid) {
        value = await methodChannel.invokeMethod<String>('close');
      } else {
        value = "true";
      }
    } catch (err) {
      value = "false";
    }
    return value;
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
