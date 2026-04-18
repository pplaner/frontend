import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/storage/cookie_jar.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/auth/presentation/screens/auth_screen.dart';
import 'package:frontend/features/notes/presentation/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:frontend/core/storage/cookie_jar.dart';
import 'package:frontend/core/storage/shared_prefs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  final cookiePath = '${appDocDir.path}/.cookies/';

  final cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        cookieJarProvider.overrideWithValue(cookieJar),
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      title: 'PPlaner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
