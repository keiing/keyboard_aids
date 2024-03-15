import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_aids/keyboard_aids.dart';
import 'package:keyboard_aids/keyboard_aids_platform_interface.dart';
import 'package:keyboard_aids/keyboard_aids_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKeyboardAidsPlatform
    with MockPlatformInterfaceMixin
    implements KeyboardAidsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KeyboardAidsPlatform initialPlatform = KeyboardAidsPlatform.instance;

  test('$MethodChannelKeyboardAids is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKeyboardAids>());
  });

  test('getPlatformVersion', () async {
    KeyboardAids keyboardAidsPlugin = KeyboardAids();
    MockKeyboardAidsPlatform fakePlatform = MockKeyboardAidsPlatform();
    KeyboardAidsPlatform.instance = fakePlatform;

    expect(await keyboardAidsPlugin.getPlatformVersion(), '42');
  });
}
