import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageindexprovider = context.watch<PageIndexProvider>();
    int currentPageIndex = pageindexprovider.getCurrentIndex;
    return SalomonBottomBar(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      currentIndex: currentPageIndex,
      onTap: (value) => pageindexprovider.updatePageIndex(value),
      items: [
        SalomonBottomBarItem(
          icon:
              Icon((currentPageIndex == 0) ? Icons.home : Icons.home_outlined),
          title: const Text('Главная'),
        ),
        SalomonBottomBarItem(
          icon:
              Icon((currentPageIndex == 1) ? Icons.chat : Icons.chat_outlined),
          title: const Text('Чат'),
        ),
        SalomonBottomBarItem(
          icon: Icon(
              (currentPageIndex == 2) ? Icons.person : Icons.person_outline),
          title: const Text('Профиль'),
        ),
      ],
    );
  }
}
