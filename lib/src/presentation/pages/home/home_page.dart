import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          )
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
