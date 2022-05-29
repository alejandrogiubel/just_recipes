import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        depth: 5,
        shadowLightColor: Theme.of(context).brightness == Brightness.light
            ? null
            : const Color(0xff413E43),
        shadowDarkColor: Theme.of(context).brightness == Brightness.light
            ? null
            : Colors.black,
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: child,
    );
  }
}
