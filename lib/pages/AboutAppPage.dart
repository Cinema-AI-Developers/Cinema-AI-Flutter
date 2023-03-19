import 'package:cinema_ai/Widgets/textWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("О приложении"),
      ),
      body: const SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                TextWidget(
                  label:
                      'Мы, команда Pixel Popcorn представляем приложение онлайн кинотеатра '
                      'с использованием Искусственного интеллекта. Данное приложение является 100% бесплатным,'
                      'так как является Open Source решением. В данном приложении вы можете смотреть фильмы,'
                      'общаться с виртуальным ассистентом, а также оставлять ваши отзывы к фильмам',
                ),
              ], // TODO add more
            ),
          ),
        ),
      ),
    );
  }
}
