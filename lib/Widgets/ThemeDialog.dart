import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Выбор темы"),
      contentPadding: const EdgeInsets.all(16.0),
      elevation: 0,
      children: [
        ListTile(
          title: const Text("Светлая"),
          onTap: () => {
            AdaptiveTheme.of(context).setLight(),
            Navigator.pop(context),
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          trailing: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? const Icon(Icons.radio_button_checked)
              : const Icon(Icons.radio_button_off),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text("Тёмная"),
          onTap: () => {
            AdaptiveTheme.of(context).setDark(),
            Navigator.pop(context),
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          trailing: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? const Icon(Icons.radio_button_checked)
              : const Icon(Icons.radio_button_off),
        ),
      ],
    );
  }
}
