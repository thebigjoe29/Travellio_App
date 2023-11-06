
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travellio/app/screens/chatroom/chatroom_controller.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class Chatroom extends GetView<BuildLayoutController> {
   Chatroom({Key? key}) : super(key: key);
  final Chatroomcontroller chatroomcontroller=Get.put(Chatroomcontroller());
  @override
  
  Widget build(BuildContext context) {
    var currentUser=chatroomcontroller.auth.currentUser;  
    print(currentUser);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatroomcontroller.storeInstance.collection("chatroom").orderBy('timestamp',descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator
                  return CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  // No data available
                  return Text('No chat rooms available.');
                }

                final messages= snapshot.data!.docs.toList();
                return ListView.builder(
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final messageData =
                          messages[index].data() as Map<String, dynamic>;
                      final sender = messageData['sender'];
                      //print(sender);
                      final text = messageData['text'];
                      final timestamp = messageData['timestamp'];
                      
                      final isCurrentUserMessage = (sender == currentUser!.email.toString());
                      //print(isCurrentUserMessage);
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5, top: 5),
                        child: Align(
                          alignment: isCurrentUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: isCurrentUserMessage
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                               Text(
                                      sender, // Display the sender's name
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 108, 107, 107)),
                                    ),
                                   SizedBox(
                                      height: 3,
                                    ),
                              IntrinsicHeight(
                                child: IntrinsicWidth(
                                  child: Container(
                                    //height: 50,
                                    //width: 100,
                                    decoration: BoxDecoration(
                                      color: isCurrentUserMessage
                                          ? Colors.blue
                                          : Colors.green,
                                      borderRadius: isCurrentUserMessage
                                          ? BorderRadius.only(
                                              topLeft: chatroomcontroller.radius,
                                              bottomLeft: chatroomcontroller.radius,
                                              bottomRight: chatroomcontroller.radius)
                                          : BorderRadius.only(
                                              topRight: chatroomcontroller.radius,
                                              bottomLeft: chatroomcontroller.radius,
                                              bottomRight: chatroomcontroller.radius),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
               // controller: message,
                decoration: InputDecoration(
                    hintText: "Type Something...",
                    suffixIcon: TextButton(
                      onPressed: () async {
                        
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: IconButton(icon: Icon(Icons.send),onPressed: (){

                      },)
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none)),
              ),
            )
        ],
      ),
    );
  }
}
