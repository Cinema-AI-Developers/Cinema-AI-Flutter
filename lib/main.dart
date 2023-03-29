import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_ai/providers/ModelsProvider.dart';
import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:cinema_ai/providers/chatProvider.dart';
import 'package:cinema_ai/scheme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'MainScreen.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
      ],
      child: AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Cinema AI',
          theme: theme,
          darkTheme: darkTheme,
          home: MainScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
