import 'package:crm_app/features/home/screens/createLead.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";


Widget buildUserCard(String name, String role, String imageUrl, {Widget? trailingIcon}) {
  return Stack(
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            role,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
      if (trailingIcon != null)
        Positioned(
          right: -11,
          top: -5,
          child: trailingIcon,
        ),
    ],
  );
}

Widget buildDustbinIconButton(VoidCallback onPressed) {
  return IconButton(
    icon: Icon(Icons.delete, color: Colors.red),
    onPressed: onPressed,
  );
}






Widget buildCreateLead() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){
          Get.to(CreateLead());
          
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white24,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      SizedBox(height: 8),
      Text(
        'Create Lead',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    ],
  );
}
