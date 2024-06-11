import 'package:crm_app/features/chats/screens/messagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildChatTile(
              imageUrl: 'https://cdn.pixabay.com/photo/2013/07/13/11/44/penguin-158551_640.png', // Replace with actual image URL
              name: 'John Doe',
              lastMsg: 'Hey, how are you?',
              time: '10:30 AM',
            ),
            _buildChatTile(
              imageUrl: 'https://cdn.pixabay.com/photo/2017/11/06/18/30/eggplant-2924511_640.png', // Replace with actual image URL
              name: 'Jane Smith',
              lastMsg: 'See you soon!',
              time: 'Yesterday',
            ),

            _buildChatTile(
              imageUrl: 'https://cdn.pixabay.com/photo/2012/04/26/19/47/penguin-42936_640.png', // Replace with actual image URL
              name: 'Penguin',
              lastMsg: 'Me on linux!',
              time: '5:00 PM',
            ),
            // Add more chat tiles as needed
          ],
        ),
      ),
    );
  }

  Widget _buildChatTile({
    required String imageUrl,
    required String name,
    required String lastMsg,
    required String time,
  }) {
    return GestureDetector(
      onTap: (){
        Get.to(MessagesScreen(name: name, imgUrl: imageUrl,));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lastMsg,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white),
              color: Colors.black,

              onSelected: (String result) {
                setState(() {

                  print(result);
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete',style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  value: 'archive',
                  child: Text('Archive',style: TextStyle(color: Colors.white)),
                ),
                const PopupMenuItem<String>(
                  value: 'snooze',
                  child: Text('Snooze',style: TextStyle(color: Colors.white)),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

}
