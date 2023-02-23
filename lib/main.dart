import 'package:cinema_ai/pages/Genres.dart';
import 'package:cinema_ai/pages/HomePage.dart';
import 'package:cinema_ai/pages/Profile.dart';
import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';
import 'MainScreen.dart';
import 'bottomNav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageIndexProvider()),
      ],
      child: MaterialApp(
        title: 'Cinema AI',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      letterSpacing: 3,
    );

    return Card(
      color: theme.colorScheme.secondary,
      elevation: 10.2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('hi'),
      ),
    );
  }
}
