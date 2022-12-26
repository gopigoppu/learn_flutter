import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_udemy/chat/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(FirebaseAuth.instance.currentUser),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final chatDocs = chatSnapshot.data!.docs;

              return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) {
                    var chat = chatDocs[index].data();
                    // String chat = chatDocs;
                    // print("$chat['text'], $chat['userId']");
                    // return Text('as');
                    print(chatDocs[index].id);

                    return MessageBubble(
                      chat['text'],
                      chat['userId'] == futureSnapshot.data!.uid,
                      key: ValueKey(chatDocs[index].id),
                    );
                  }
                  // Text((chatDocs[index].data() as Map)['text'] ?? ''),
                  );
            });
      },
    );
  }
}
