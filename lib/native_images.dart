import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/foundation.dart'
    show SynchronousFuture, describeIdentity;

// Performs exactly like a MemoryImage but instead of taking in bytes it takes
// in a future that represents bytes.
class FutureMemoryImage extends ImageProvider<FutureMemoryImage> {
  const FutureMemoryImage(this.futureBytes, {this.scale = 1.0})
      : assert(futureBytes != null),
        assert(scale != null);

  final Future<Uint8List> futureBytes;

  final double scale;

  @override
  Future<FutureMemoryImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<FutureMemoryImage>(this);
  }

  @override
  ImageStreamCompleter load(FutureMemoryImage key) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
    );
  }

  Future<ui.Codec> _loadAsync(FutureMemoryImage key) async {
    assert(key == this);
    return futureBytes.then((Uint8List bytes) {
      return PaintingBinding.instance.instantiateImageCodec(bytes);
    });
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final FutureMemoryImage typedOther = other;
    return futureBytes == typedOther.futureBytes && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(futureBytes.hashCode, scale);

  @override
  String toString() =>
      '$runtimeType(${describeIdentity(futureBytes)}, scale: $scale)';
}

class NativeImages {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/native_images');

  static FutureMemoryImage load(String name) {
    return FutureMemoryImage(_channel.invokeMethod('loadImage', name));
  }
}
