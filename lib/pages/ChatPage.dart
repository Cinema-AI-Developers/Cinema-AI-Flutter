import 'dart:developer';

import 'package:cinema_ai/Constants/chatMessages.dart';
import 'package:cinema_ai/Models/ChatModel.dart';
import 'package:cinema_ai/api/AIResponse.dart';
import 'package:cinema_ai/Widgets/chatWidget.dart';
import 'package:cinema_ai/providers/ModelsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chat> {
  bool _isTyping = false;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
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
                  itemCount: chatList.length,
                  itemBuilder: (context, index) => ChatWidget(
                        msg: chatList[index].msg,
                        chatIndex: chatList[index].chatIndex,
                      )),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(color: Colors.black, size: 18),
            ],
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
                        focusNode: focusNode,
                        style: const TextStyle(color: Colors.black),
                        controller: textEditingController,
                        onSubmitted: (value) async {
                          await sendMessageFCT(modelsProvider: modelsProvider);
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText:
                                "Меня зовут Дэвид. Как я могу помочь вам?",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await sendMessageFCT(modelsProvider: modelsProvider);
                        },
                        icon: const Icon(Icons.send))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessageFCT({
    required ModelsProvider modelsProvider,
  }) async {
    //TODO make normal
    try {
      String temp = "";
      setState(() {
        _isTyping = true;
        chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        temp = textEditingController.text;
        textEditingController.clear();
        focusNode.unfocus();
      });
      chatList.addAll(await AIModelResponse.sendMessage(
        message: temp,
        modelId: modelsProvider.getCurrentModel,
      ));
      setState(() {});
    } catch (error) {
      log("$error");
    } finally {
      setState(
        () => _isTyping = false,
      );
    }
  }
}
