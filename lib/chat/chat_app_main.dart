import 'package:flutter/material.dart';
import 'package:learn_udemy/chat/screens/chat_screen.dart';
import 'package:learn_udemy/main.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: chatTheme(),
      home: ChatScreen(),
    );
  }
}
