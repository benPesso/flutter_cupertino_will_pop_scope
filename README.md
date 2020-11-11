# CupertinoWillPopScope

[![pub package](https://img.shields.io/pub/v/cupertino_will_pop_scope.svg)](https://pub.dev/packages/cupertino_will_pop_scope)

> _Note: This package can be used on any platform, and is not specific to iOS. `ConditionalWillPopScope` and `CupertinoWillPopScopePageTransionsBuilder` can each be used seprately._

<br />

### CupertinoWillPopScopePageTransionsBuilder

The key to this package is a modified version of Flutter's [CupertinoPageRoute](https://api.flutter.dev/flutter/cupertino/CupertinoPageRoute-class.html), which has been enhanced with the following:
- Visual feedback when users attempt to "swipe to go back" - the screen is allowed to be dragged a bit before it is snapped back to place.
- If an enclosing route has `willPop` callbacks, they are triggered once the screen is snapped back to place.


### ConditionalWillPopScope

When using this widget, be sure to update `shouldAddCallbacks` based on the state of your screen, and only set it to `true` when  the screen **should not be allowed to pop**. Additionally, the `onWillPop` property should not be changed once set.

-------

A working app using this package can be found in the [example](example/lib/main.dart) folder.

## Usage

To use this package, add `cupertino_will_pop_scope` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).


## Example
### Import the library

``` dart
// main.dart
import 'package:decorated_icon/cupertino_will_pop_scope.dart';
```

### Configure page transitions
Set the transition builder of the desired platform to `CupertinoWillPopScopePageTransionsBuilder` in your theme configuration.
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

> ###### Make sure the theme is applied to the app.
```dart
// main.dart
MaterialApp(
  ...
  theme: theme,
  home: HomeScreen(),
);
```

### Wrap your screen
Using the included `ConditionalWillPopScope` widget, or Flutter's [WillPopScope](https://api.flutter.dev/flutter/widgets/WillPopScope-class.html) widget, wrap your screen and define an `onWillPop` callback for it.
> ##### Note that `onWillPop` should always return a `bool`. See the [Flutter Docs](https://api.flutter.dev/flutter/widgets/WillPopScope-class.html) for more.

###### Using ConditionalWillPopScope:
```dart
// my_screen.dart
@override
Widget build(BuildContext context) {
  return ConditionalWillPopScope(
    child: _MyScreenContent(),
    onWillPop: _onWillPop,
    shouldAddCallbacks: _hasChanges,
  );
}
```

###### Using WillPopScope:
```dart
// my_screen.dart
@override
Widget build(BuildContext context) {
  return WillPopScope(
    child: _MyScreenContent(),
    onWillPop: _hasChanges ? _onWillPop : null,
  );
}
```

> :warning: When using Flutter's `WillPopScope` widget, the  `onWillPop` must be set conditionally. Otherwise, the "swipe to go back" gesture may not work properly. In the example above, this is achieved by using `_hasChanges` as the condition.