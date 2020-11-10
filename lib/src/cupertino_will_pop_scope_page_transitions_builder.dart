import 'package:flutter/material.dart';

import 'cupertino_page_route.dart';

class CupertinoWillPopScopePageTransionsBuilder
    extends PageTransitionsBuilder {
  const CupertinoWillPopScopePageTransionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoPageRoute.buildPageTransitions<T>(
        route, context, animation, secondaryAnimation, child);
  }
}
