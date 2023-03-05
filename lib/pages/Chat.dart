import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chat> {
  bool _isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Чатик :3"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: 6, itemBuilder: (context, index) => Text("Chat")),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(color: Colors.black, size: 18),
            const SizedBox(
              height: 15,
            ),
            Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        controller: textEditingController,
                        onSubmitted: (value) {
                          //TODO send message
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: "Меня зовут Лиза. Как я могу помочь вам?",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                  ],
                ),
              ),
            )
          ]
        ],
      )),
    );
  }
}
