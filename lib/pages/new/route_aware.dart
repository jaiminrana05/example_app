import 'package:flutter/material.dart';

import '../../main.dart';

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget child;

  const RouteAwareWidget(this.name, {required this.child});

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    print('didPush ${widget.name}');
  }

  @override
  void didPop() {
    debugPrint('didPop ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
