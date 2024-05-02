#include "keyboard_aids_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

namespace keyboard_aids
{

  // static
  void KeyboardAidsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "keyboard_aids",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<KeyboardAidsPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  KeyboardAidsPlugin::KeyboardAidsPlugin() {}

  KeyboardAidsPlugin::~KeyboardAidsPlugin() {}

  void KeyboardAidsPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {

    const std::string method_name = method_call.method_name();

    if (method_name.compare("getPlatformVersion") == 0)
    {
      std::ostringstream version_stream;
      version_stream << "Windows ";
      if (IsWindows10OrGreater())
      {
        version_stream << "10+";
      }
      else if (IsWindows8OrGreater())
      {
        version_stream << "8";
      }
      else if (IsWindows7OrGreater())
      {
        version_stream << "7";
      }
      result->Success(flutter::EncodableValue(version_stream.str()));
    }
    else if (method_name.compare("open") == 0)
    {
      result->Success(flutter::EncodableValue("open"));
    }
    else if (method_name.compare("close") == 0)
    {
      result->Success(flutter::EncodableValue("close"));
    }
    else
    {
      result->NotImplemented();
    }
  }

} // namespace keyboard_aids
