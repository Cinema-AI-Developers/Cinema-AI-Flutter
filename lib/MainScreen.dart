import 'package:cinema_ai/pages/HomePage.dart';
import 'package:cinema_ai/pages/Profile.dart';
import 'package:cinema_ai/pages/Chat.dart';
import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/BottomNav.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pages = [HomePage(), Chat(), Profile()];

  @override
  Widget build(BuildContext context) {
    int currentScreenIndex = context.watch<PageIndexProvider>().getCurrentIndex;

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: pages[currentScreenIndex],
    );
  }
}
