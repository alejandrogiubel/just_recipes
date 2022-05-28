// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_recipes/l10n/l10n.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: FlexColorScheme.light(
        scheme: FlexScheme.flutterDash,
        appBarStyle: FlexAppBarStyle.material,
        textTheme: GoogleFonts.montserratTextTheme(),
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.flutterDash,
        textTheme: GoogleFonts.montserratTextTheme(),
      ).toTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
