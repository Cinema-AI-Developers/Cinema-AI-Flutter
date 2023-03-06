import 'package:cinema_ai/Widgets/textWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0
              ? Colors.white
              : const Color.fromARGB(255, 243, 243, 243),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  chatIndex == 0
                      ? Icons.person // TODO add picture profile
                      : Icons.android, // TODO @freedom715 😊
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            displayFullTextOnTap: true,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TyperAnimatedText(msg.trim(),
                                  speed: const Duration(milliseconds: 10)),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
