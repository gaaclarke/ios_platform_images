# Native Images

A Flutter plugin to access various native image resources from Flutter.

## Usage

This plugin is experimental and must be manually integrated into your app.
Ideally it would be integrated into Flutter's plugins.

### Example

``` dart
// Import package
import 'package:native_images/native_images.dart';

Widget build(BuildContext context) {
  // ...
  return DecoratedBox(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NativeImage('Foo'),
        // ...
      ),
      // ...
    ),
  );
  // ...
}
```
