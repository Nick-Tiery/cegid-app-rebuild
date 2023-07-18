import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';

class WillPopScopeGeneric extends StatelessWidget {
  final Widget child;
  final bool onWillPop;
  final VoidCallback action;

  const WillPopScopeGeneric({
    Key? key, 
    required this.child, 
    required this.action,
    this.onWillPop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx < 0 ||
                  details.velocity.pixelsPerSecond.dx > 0) {
                if (onWillPop) {
                  action();
                }
              }
            },
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: child,
            ),
          )
        : WillPopScope(
            child: child,
            onWillPop: () async {
              action();
              return onWillPop;
            },
          );
  }
}