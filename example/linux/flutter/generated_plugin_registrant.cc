//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <keyboard_aids/keyboard_aids_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) keyboard_aids_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "KeyboardAidsPlugin");
  keyboard_aids_plugin_register_with_registrar(keyboard_aids_registrar);
}
