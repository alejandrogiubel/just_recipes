import 'package:flutter/material.dart';

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton({super.key});

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
            child: const Text('Browse more recipes'),
            onPressed: () {
              print('Pressed');
            },
          ),
        ),
      ],
    );
  }
}
