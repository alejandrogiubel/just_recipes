import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  const FailWidget({required this.error, super.key});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
