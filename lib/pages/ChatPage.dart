import 'dart:developer';
import 'package:cinema_ai/Models/ChatModel.dart';
import 'package:cinema_ai/Widgets/ErrorMessage.dart';
import 'package:cinema_ai/Widgets/TextWidgetDialog.dart';
import 'package:cinema_ai/Widgets/textWidget.dart';
import 'package:cinema_ai/api/AIResponse.dart';
import 'package:cinema_ai/Widgets/chatWidget.dart';
import 'package:cinema_ai/providers/ModelsProvider.dart';
import 'package:cinema_ai/providers/chatProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPage> {
  late ScrollController _listScrollController;
  bool _isTyping = false;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  // List<ChatModel> chatList = [];
  @override
  void initState() {
    _listScrollController = ScrollController();
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Чатик ^_____^"),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => const TextModelDialog(),
              );
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  controller: _listScrollController,
                  itemCount: chatProvider.getChatList.length, //chatList.length,
                  itemBuilder: (context, index) => ChatWidget(
                        msg: chatProvider
                            .getChatList[index].msg, // chatList[index].msg,
                        chatIndex: chatProvider.getChatList[index]
                            .chatIndex, // chatList[index].chatIndex,
                      )),
            ),
            if (_isTyping) ...[
              const Material(
                color: Colors.white,
                child: SpinKitThreeBounce(color: Colors.black, size: 18),
              ),
            ],
            Material(
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
                          await sendMessage(
                            modelsProvider: modelsProvider,
                            chatProvider: chatProvider,
                          );
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText:
                                "Меня зовут Дэвид. Как я могу помочь вам?",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await sendMessage(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider,
                        );
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEnd() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut);
  }

  Future<void> sendMessage({
    required ModelsProvider modelsProvider,
    required ChatProvider chatProvider,
  }) async {
    if (_isTyping) {
      ErrorMessage.showSnackbar(
          context, "Подождите, пока запрос обработается 😃");
      return;
    }
    if (textEditingController.text.isEmpty) {
      ErrorMessage.showSnackbar(context, "Пожалуйста, напишите сообщение 😊");
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(
        () {
          _isTyping = true;
          chatProvider.addUserMessage(msg: msg);
          // chatList
          //     .add(ChatModel(msg: textEditingController.text, chatIndex: 0));
          textEditingController.clear();
          focusNode.unfocus();
        },
      );
      await chatProvider.sendMessageAndGetAnswers(
        msg: msg,
        chosenModelId: modelsProvider.getCurrentModel,
      );
      // chatList.addAll(
      //   await AIModelResponse.sendMessage(
      //     message: temp,
      //     modelId: modelsProvider.getCurrentModel,
      //   ),
      // );
      setState(() {});
    } catch (error) {
      log("$error");
      ErrorMessage.showSnackbar(
        context,
        error.toString(),
      );
    } finally {
      setState(
        () {
          scrollListToEnd();
          _isTyping = false;
        },
      );
    }
  }
}
