import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/app/init.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/notes/presentation/screens/calendar_screen.dart';
import 'package:frontend/features/notes/presentation/screens/home_screen.dart';
import 'package:frontend/features/profile/presentation/screens/personalization_screen.dart';
import 'package:frontend/features/profile/presentation/screens/profile_screen.dart';
import 'package:frontend/features/vault/presentation/screens/auth_screen.dart';
import 'package:frontend/i18n/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/theme/theme_provider.dart';

void main() async {
  await initializeGlobalSettings();

  const root = MyApp();

  final app = await wrapWithProviderScope(
    child: wrapWithTranslation(child: root),
  );

  runApp(app);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'PPlaner',
      debugShowCheckedModeBanner: false,

      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,

      home: const CalendarScreen(),
    );
  }
}
