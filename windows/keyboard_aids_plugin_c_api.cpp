#include "include/keyboard_aids/keyboard_aids_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "keyboard_aids_plugin.h"

void KeyboardAidsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  keyboard_aids::KeyboardAidsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
