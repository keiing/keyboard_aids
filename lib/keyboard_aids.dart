
import 'keyboard_aids_platform_interface.dart';

class KeyboardAids {

  /// 禁止没有焦点 按下键位弹出键盘 注意一旦开启后键盘按下无法在走输入法，而是会将中文直接写入输入框
  Future<String?> open() {
    return KeyboardAidsPlatform.instance.open();
  }

  /// 允许失去焦点后 按下键位弹出键盘
  Future<String?> close() {
    return KeyboardAidsPlatform.instance.close();
  }

  Future<String?> getPlatformVersion() {
    return KeyboardAidsPlatform.instance.getPlatformVersion();
  }
}
