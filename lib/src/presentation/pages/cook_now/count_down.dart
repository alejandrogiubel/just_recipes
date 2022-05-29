import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_recipes/src/presentation/utils/extensions/extensions.dart';

class CountDown extends StatefulWidget {
  const CountDown({
    required this.initialDuration,
    this.getTimer,
    this.onFinish,
    super.key,
  });
  final Duration initialDuration;
  final Function(Timer timer)? getTimer;
  final Function()? onFinish;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Duration _duration = Duration.zero;
  @override
  void initState() {
    super.initState();
    _duration = widget.initialDuration;
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration == Duration.zero) {
        timer.cancel();
        widget.onFinish?.call();
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });

    widget.getTimer?.call(timer);
  }

  @override
  Widget build(BuildContext context) {
    return Text(_duration.toText());
  }
}
