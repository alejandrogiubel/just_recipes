import 'package:flutter/material.dart';

class CookNowPage extends StatelessWidget {
  const CookNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Time to cook!'),
            Card(
              elevation: 0,
              child: Row(
                children: [
                  Column(
                    children: const [
                      Text('Steps'),
                      Text('Description'),
                      Text('More description'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[200]
                    : const Color(0xff313234),
                shape: BoxShape.circle,
                boxShadow: [
                  const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
