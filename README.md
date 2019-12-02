# IOS Platform Images

A Flutter plugin to access various host image resources from Flutter.

## Usage

This plugin is experimental and must be manually integrated into your app.
Ideally it would be integrated into Flutter's plugins.

### Example

``` dart
// Import package
import 'package:ios_platform_images/ios_platform_images.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Image(image: IosPlatformImages.load("pug")),
      ),
      //..
    ),
  );
}
```

## Attribution ##
`pug.jpg` courtesy of [Charles](https://www.pexels.com/photo/adult-black-pug-1851164/).