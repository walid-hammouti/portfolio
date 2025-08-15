import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/generated/l10n/app_localizations.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/style/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(appLocalProvider);
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
        Locale('ar'), // Arabic
      ],

      locale: Locale(local.value ?? 'en'),
      darkTheme: AppTheme(fontFamily: getFontFamily(local.value ?? 'en')).dark,
      theme: AppTheme(fontFamily: getFontFamily(local.value ?? 'en')).light,
      themeMode: theme.value == 'dark' ? ThemeMode.dark : ThemeMode.light,

      home: HomePage(),
    );
  }

  String getFontFamily(String locale) {
    return locale == 'ar' ? 'BalooBhaijaan2' : 'Poppins';
  }
}
