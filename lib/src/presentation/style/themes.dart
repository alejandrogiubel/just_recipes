import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const cardLightColor = Colors.white;
const cardDarkColor = Color(0xFF373539);

final lightTheme = FlexColorScheme.light(
  appBarStyle: FlexAppBarStyle.material,
  textTheme: GoogleFonts.workSansTextTheme(),
  scheme: FlexScheme.damask,
  scaffoldBackground: const Color(0xFFF5F3F1),
).toTheme;

final darkTheme = FlexColorScheme.dark(
  textTheme: GoogleFonts.workSansTextTheme(
    ThemeData(
      brightness: Brightness.dark,
    ).textTheme,
  ),
  scheme: FlexScheme.damask,
  scaffoldBackground: const Color(0xFF121214),
).toTheme;
