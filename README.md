# IOS Platform Images

A Flutter plugin to share images between Flutter and iOS.

This allows Flutter to load images from Images.xcassets and iOS code to load
Flutter images.

## Usage

This plugin is experimental and must be manually integrated into your app.
Ideally it would be integrated into Flutter's plugins.

### iOS->Flutter Example

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

### Flutter->iOS Example

```objc
#import <ios_platform_images/UIImage+ios_platform_images.h>

static UIImageView* MakeImage() {
  UIImage* image = [UIImage flutterImageWithName:@"assets/foo.png"];
  return [[UIImageView alloc] initWithImage:image];
}
```


## Attribution ##
`pug.jpg` courtesy of [Charles](https://www.pexels.com/photo/adult-black-pug-1851164/).
