import 'package:flutter/material.dart';

/// An enhanced version of [WillPopScope] that adds additional functionality.
class ConditionalWillPopScope extends StatefulWidget {
  /// Creates a widget that registers a callback to veto attempts by the user to
  /// dismiss the enclosing [ModalRoute].
  ///
  /// The `child` and `shouldAddCallbacks` arguments must not be `null`.
  const ConditionalWillPopScope({
    Key key,
    @required this.child,
    @required this.onWillPop,
    this.shouldAddCallbacks,
  })  : assert(child != null),
        super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// Called to veto attempts by the user to dismiss the enclosing [ModalRoute].
  ///
  /// If the callback returns a [Future] that resolves to `false`, the enclosing
  /// route will not be popped.
  final WillPopCallback onWillPop;

  /// Determines if the `onWillPop` callback should be added to the enclosing [ModalRoute].
  final bool shouldAddCallbacks;

  @override
  _ConditionalWillPopScopeState createState() => _ConditionalWillPopScopeState();
}

class _ConditionalWillPopScopeState extends State<ConditionalWillPopScope> {
  ModalRoute<dynamic> _route;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.onWillPop != null)
      _route?.removeScopedWillPopCallback(widget.onWillPop);
    _route = ModalRoute.of(context);
    if (widget.onWillPop != null && widget.shouldAddCallbacks)
      _route?.addScopedWillPopCallback(widget.onWillPop);
  }

  @override
  void didUpdateWidget(ConditionalWillPopScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(_route == ModalRoute.of(context));
    if (_route != null &&
        (widget.onWillPop != oldWidget.onWillPop ||
            widget.shouldAddCallbacks != oldWidget.shouldAddCallbacks)) {
      if (oldWidget.onWillPop != null)
        _route.removeScopedWillPopCallback(oldWidget.onWillPop);
      if (widget.onWillPop != null && widget.shouldAddCallbacks)
        _route.addScopedWillPopCallback(widget.onWillPop);
    }
  }

  @override
  void dispose() {
    if (widget.onWillPop != null)
      _route?.removeScopedWillPopCallback(widget.onWillPop);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
