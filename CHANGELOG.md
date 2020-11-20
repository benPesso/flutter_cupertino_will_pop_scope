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