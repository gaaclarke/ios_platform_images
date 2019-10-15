import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';

class NativeImages {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/native_images');

  static Future<ImageProvider> load(String name) async {
    final Uint8List data = await _channel.invokeMethod('loadImage', name);
    return MemoryImage(data);
  }
}
