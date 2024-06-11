import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSettingScreen extends StatefulWidget {
  const ChatSettingScreen({Key? key}) : super(key: key);

  @override
  State<ChatSettingScreen> createState() => _ChatSettingScreenState();
}

class _ChatSettingScreenState extends State<ChatSettingScreen> {
  bool notification=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.black,

      body:               InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[700],
            border: Border.all(color: Colors.black12), // Border color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          margin: EdgeInsets.symmetric(vertical: 8), // Vertical spacing between tiles
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Icon(Icons.wechat_sharp, color: Colors.white),
            title: Text(
              "Chat Notification",
              style: TextStyle(color: Colors.white),
            ),
            trailing:         Switch(
              value: notification,
              onChanged: (bool value) {
                setState(() {
                  notification = value;
                });
              },
            ),

          ),
        ),
      ),

    );
  }
}
