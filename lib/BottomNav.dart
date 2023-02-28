import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomNav.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageindexprovider = context.watch<PageIndexProvider>();
    int currentPageIndex = pageindexprovider.getCurrentIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // need shifting.. but with color from fixed
      elevation: 1.5,
      currentIndex: currentPageIndex,
      onTap: (value) => pageindexprovider.updatePageIndex(value),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      items: [
        BottomNavigationBarItem(
          label: 'Главная',
          icon: Icon((currentPageIndex == 0)
              ? Icons.home
              : Icons
                  .home_outlined), // provide color to any one icon as it will overwrite the whole bottombar's color ( if provided any )
          //backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          label: 'Жанры',
          icon: Icon(
              (currentPageIndex == 1) ? Icons.topic : Icons.topic_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Профиль',
          icon: Icon(
              (currentPageIndex == 2) ? Icons.person : Icons.person_outline),
        ),
      ],
    );
  }
}
