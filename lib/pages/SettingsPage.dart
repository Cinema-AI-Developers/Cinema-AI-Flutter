import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_ai/Widgets/TextWidgetDialog.dart';
import 'package:cinema_ai/Widgets/ThemeDialog.dart';
import 'package:cinema_ai/providers/ModelsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Настройки"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 8),
            ListTile(
              title: const Text("Тема"),
              leading: const Icon(Icons.palette_outlined),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (context) => const ThemeDialog(),
                ),
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text("Языковая модель"),
              leading: const Icon(Icons.palette_outlined),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const TextModelDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
