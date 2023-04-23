import 'package:cinema_ai/providers/ModelsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextModelDialog extends StatelessWidget {
  const TextModelDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
          trailing: Provider.of<ModelsProvider>(context).getCurrentModel ==
                  "gpt-3.5-turbo"
              ? const Icon(Icons.radio_button_checked)
              : const Icon(Icons.radio_button_off),
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
          trailing: Provider.of<ModelsProvider>(context).getCurrentModel ==
                  "text-davinci-003"
              ? const Icon(Icons.radio_button_checked)
              : const Icon(Icons.radio_button_off),
        ),
      ],
    );
  }
}
