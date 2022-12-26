import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _chatMessagesStream = FirebaseFirestore.instance
      .collection('chats/mqOOhAzlIeG97FJbOHvp/messages')
      .snapshots();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: ((itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            }),
          )
        ],
      ),
      body: StreamBuilder(
        stream: _chatMessagesStream,
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
            itemBuilder: ((context, index) => Container(
                  padding: EdgeInsets.all(8),
                  child:
                      Text((documents[index].data() as Map)['text'] as String),
                )),
            itemCount: documents.length ?? 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final CollectionReference _chatMessagesCollection = FirebaseFirestore
              .instance
              .collection('chats/mqOOhAzlIeG97FJbOHvp/messages');
          await _chatMessagesCollection
              .add({'text': 'New one by button click'}).then(
                  (value) => print(value));

          // await Firebase.initializeApp();
          // FirebaseFirestore firestore = FirebaseFirestore.instance;
          // firestore
          //     .collection('chats/mqOOhAzlIeG97FJbOHvp/messages')
          //     .snapshots()
          //     .listen(
          //   (data) {
          //     print(data.docs);
          //   },
          // );
        },
      ),
    );
  }
}
