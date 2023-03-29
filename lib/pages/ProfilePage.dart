import 'package:cinema_ai/Widgets/ButtonWidget.dart';
import 'package:cinema_ai/pages/AboutAppPage.dart';
import 'package:cinema_ai/pages/SettingsPage.dart';
import 'package:cinema_ai/providers/PageIndexProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Профиль"),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _InitialProfileStatePage(), // TODO add bloc
              ),
            );
          },
        ),
      ),
    );
  }
}

class _InitialProfileStatePage extends StatelessWidget {
  const _InitialProfileStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        ButtonWidget(
          text: 'Войти',
          onClick: () {},
        ),
        const SizedBox(height: 8),
        ButtonWidget(
          text: 'О приложении',
          onClick: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutAppPage(),
              ),
            ),
          },
        ),
        const SizedBox(height: 8),
        ButtonWidget(
          text: 'Настройки',
          onClick: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
          },
        ),
      ],
    );
  }
}
