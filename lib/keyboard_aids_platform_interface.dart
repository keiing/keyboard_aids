import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'keyboard_aids_method_channel.dart';

abstract class KeyboardAidsPlatform extends PlatformInterface {
  /// Constructs a KeyboardAidsPlatform.
  KeyboardAidsPlatform() : super(token: _token);

  static final Object _token = Object();

  static KeyboardAidsPlatform _instance = MethodChannelKeyboardAids();

  /// The default instance of [KeyboardAidsPlatform] to use.
  ///
  /// Defaults to [MethodChannelKeyboardAids].
  static KeyboardAidsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KeyboardAidsPlatform] when
  /// they register themselves.
  static set instance(KeyboardAidsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 禁止没有焦点 按下键位弹出键盘
  Future<String?> open() {
    throw UnimplementedError('open() has not been implemented.');
  }

  /// 允许失去焦点后 按下键位弹出键盘
  Future<String?> close() {
    throw UnimplementedError('close() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
