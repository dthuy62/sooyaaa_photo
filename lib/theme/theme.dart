import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
