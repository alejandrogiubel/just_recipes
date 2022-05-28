import 'package:flutter/material.dart';
import 'package:just_recipes/src/presentation/utils/animations/animations.dart';

extension WidgetExtension on Widget {
  Widget get withDominoAnimation {
    return DominoRevealAnimation(
      child: this,
    );
  }

  Widget withDominoDelayedRevealAnimation(Duration duration) {
    return DominoDelayedRevealAnimation(
      delay: duration,
      child: this,
    );
  }

  Widget verticalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget horizontalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget symmetricPadding(double verticalPadding, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: this,
    );
  }
}
