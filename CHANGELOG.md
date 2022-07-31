## [1.2.1]
- Merged with latest version of Flutter's `cupertino_page_route.dart`.
## [1.2.0]
- [BREAKING] Renamed `ConditionalWillPopScope`'s `shouldAddCallbacks` to `shouldAddCallback`.
- Changed all properties of `ConditionalWillPopScope` to be required.
- Changed the logic for dismissing the swipe back gesture on iOS to use the "drag cancelled" handler, instead of the "darg ended" handler.

## [1.1.0]

- Updated with latest version of Flutter's `route.dart` file.
- Update sample app to use `ElevatedButton` instead of the deprecated `RaisedButton` widget.
- Changed `ConditionalWillPopScope.onWillPop` to be optional.
- Migrated to Null Safety.

## [1.0.4]

- Fixed documentation.

## [1.0.3]

- Fixed formatting.

## [1.0.2]

- Fixed Flutter's own asserts, which fail Pub.dev's static analysis.
- Updated the package description.

## [1.0.1]

- Introduced a new `ConditionalWillPopScope` widget which makes it possible to add `willPop` callbacks conditionally.
- Added a small time delay before calling the route's `willPop` callbacks, to accomodate for the screen's "rewind" animation.
- Increased the distance a screen is allowed to be dragged before the gesture is terminated. (From 33% to 42%.)
- Updated the example app and docs.

## [1.0.0]

- Initial release.