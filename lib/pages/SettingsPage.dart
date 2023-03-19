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
                  builder: (context) => SimpleDialog(
                    title: const Text("Выбор темы"),
                    contentPadding: const EdgeInsets.all(16.0),
                    elevation: 0,
                    children: [
                      ListTile(
                          title: const Text("Светлая"),
                          onTap: () => Navigator.pop(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          trailing: const Icon(
                              Icons.check_box) // TODO add theme changer
                          ),
                      const SizedBox(height: 8),
                      ListTile(
                        title: const Text("Тёмная"),
                        onTap: () => Navigator.pop(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        trailing: const Icon(Icons
                            .check_box_outline_blank), // TODO add theme changer
                      ),
                    ],
                  ),
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
                  builder: (context) => SimpleDialog(
                    title: const Text("Выбор текстовой модели"),
                    contentPadding: const EdgeInsets.all(16),
                    elevation: 0,
                    children: [
                      ListTile(
                        title: const Text("gpt-3.5-turbo (рекомендуемая)"),
                        onTap: () {
                          Provider.of<ModelsProvider>(context, listen: false)
                              .setCurrentModel("gpt-3.5-turbo");
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        trailing: Provider.of<ModelsProvider>(context)
                                    .getCurrentModel ==
                                "gpt-3.5-turbo"
                            ? const Icon(Icons.check_box)
                            : const Icon(Icons.check_box_outline_blank),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        title: const Text("text-davinci-003"),
                        onTap: () {
                          Provider.of<ModelsProvider>(context, listen: false)
                              .setCurrentModel("text-davinci-003");
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        trailing: Provider.of<ModelsProvider>(context)
                                    .getCurrentModel ==
                                "text-davinci-003"
                            ? const Icon(Icons.check_box)
                            : const Icon(Icons.check_box_outline_blank),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
