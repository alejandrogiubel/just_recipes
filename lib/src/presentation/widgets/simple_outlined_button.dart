import 'package:flutter/material.dart';

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton({
    this.onPressed,
    required this.text,
    super.key,
  });
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(0, 50),
              side: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              primary: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: onPressed,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
