# CupertinoWillPopScope

[![pub package](https://img.shields.io/pub/v/cupertino_will_pop_scope.svg)](https://pub.dev/packages/cupertino_will_pop_scope)

This package is a modified version of Flutter's [CupertinoPageRoute](https://api.flutter.dev/flutter/cupertino/CupertinoPageRoute-class.html). It adds the following enhancements:
1. Visual indication is added to routes when users attempt to swipe back - the screen is allowed to be dragged a ⅓ of the way, and then it is snapped back.
2. The route's `willPop` callbacks are triggered when users attemp to swipe back.

-------
A working example can be found in the [example](example/lib/main.dart) folder.

## Usage

To use this package, add `cupertino_will_pop_scope` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).


## Example
### Import the library

``` dart
// main.dart
import 'package:decorated_icon/cupertino_will_pop_scope.dart';
```

### Configure page transitions
In your `theme`, set the `Target.iOS` transition builder to `CupertinoWillPopScopePageTransionsBuilder()`.
```dart
// main.dart
theme = ThemeData(
  ...
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  ),
);
```

Then apply the theme to the app.
```dart
// main.dart
MaterialApp(
  theme: theme,
  home: HomeScreen(),
);
```

### Use a `WillPopScope` widget
Wrap your screen with a [WillPopScope](https://api.flutter.dev/flutter/widgets/WillPopScope-class.html) widget and set its `onWillPop` callback.


```dart
// my_screen.dart
@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: _hasChanges ? _onWillPop : null,
    child: _MyScreenContent(),
  );
}
```

|:warning: IMPORTANT|
|---|
|• `onWillPop` must be set conditionally. Otherwise, the "swipe to go back" gesture may not work properly.<br />In the example above, `_hasChanges` is a `bool` that is set to `true` via `setState` whenever the back navigation should be disabled.<br />• `onWillPop` should return a `bool`. See the [Flutter Docs](https://api.flutter.dev/flutter/widgets/WillPopScope-class.html) for more. |