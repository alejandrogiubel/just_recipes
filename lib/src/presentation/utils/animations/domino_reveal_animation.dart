import 'package:flutter/material.dart';
import 'package:just_recipes/src/presentation/utils/animations/domino_delayed_reveal_animation.dart';

class DominoRevealAnimation extends StatefulWidget {
  const DominoRevealAnimation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DominoRevealAnimation> createState() => _DominoRevealAnimationState();
}

class _DominoRevealAnimationState extends State<DominoRevealAnimation> {
  @override
  void initState() {
    super.initState();
    _getDelay();
  }

  Duration _dominoDelay = Duration.zero;

  Duration _getDelay() {
    return _dominoDelay += const Duration(milliseconds: 100);
  }

  @override
  Widget build(BuildContext context) {
    return DominoDelayedRevealAnimation(
      delay: _getDelay(),
      child: widget.child,
    );
  }
}
