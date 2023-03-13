import 'package:cinema_ai/Widgets/ButtonWidget.dart';
import 'package:cinema_ai/pages/AboutAppPage.dart';
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
                child: InitialProfileStatePage(), // TODO add bloc
              ),
            );
          },
        ),
      ),
    );
  }
}

class InitialProfileStatePage extends StatelessWidget {
  const InitialProfileStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        ButtonWidget(
            text: 'Войти',
            onClick: () {},
            backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
        const SizedBox(height: 8),
        ButtonWidget(
            text: 'О приложении',
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppPage()),
              );
            },
            backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
        const SizedBox(height: 8),
        ButtonWidget(
            text: 'Настройки',
            onClick: () {},
            backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      ],
    );
  }
}