import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSchemeDropdown extends StatefulWidget {
  const ColorSchemeDropdown({
    this.onChanged,
    required this.initialScheme,
    super.key,
  });
  final ValueChanged<FlexScheme>? onChanged;
  final String initialScheme;

  @override
  State<ColorSchemeDropdown> createState() => _ColorSchemeDropdownState();
}

class _ColorSchemeDropdownState extends State<ColorSchemeDropdown> {
  FlexScheme _selectedColorScheme = FlexScheme.damask;

  @override
  void initState() {
    super.initState();
    _selectedColorScheme = FlexScheme.values.firstWhere(
      (scheme) => scheme.toString() == widget.initialScheme,
      orElse: () => FlexScheme.damask,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<FlexScheme>(
      value: _selectedColorScheme,
      onChanged: (value) {
        widget.onChanged?.call(value!);
        if (Theme.of(context).brightness == Brightness.light) {
          ThemeSwitcher.of(context).changeTheme(
            theme: FlexColorScheme.light(
              scheme: value,
              appBarStyle: FlexAppBarStyle.material,
              textTheme: GoogleFonts.workSansTextTheme(),
              scaffoldBackground: const Color(0xFFF5F3F1),
            ).toTheme,
          );
        } else {
          ThemeSwitcher.of(context).changeTheme(
            theme: FlexColorScheme.dark(
              scheme: value,
              textTheme: GoogleFonts.workSansTextTheme(
                ThemeData(
                  brightness: Brightness.dark,
                ).textTheme,
              ),
              scaffoldBackground: const Color(0xFF252527),
            ).toTheme,
          );
        }
        _selectedColorScheme = value!;
        // context.read<SettingsCubit>().saveColorSchema(colorSchema: value);
      },
      items: FlexScheme.values.map((value) {
        return DropdownMenuItem<FlexScheme>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
