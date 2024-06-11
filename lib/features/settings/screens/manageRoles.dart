import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ManageRolesScreen extends StatefulWidget {
  const ManageRolesScreen({Key? key}) : super(key: key);

  @override
  State<ManageRolesScreen> createState() => _ManageRolesScreenState();
}

class _ManageRolesScreenState extends State<ManageRolesScreen> {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Sam Hassoun',
      'email': 'windsor.hassoun@gmail.com',
      'role': 'Developer',
      'image': 'https://cdn.pixabay.com/photo/2012/04/26/19/47/penguin-42936_640.png', // Replace with actual image path
    },
    {
      'name': 'Sam Hassoun',
      'email': 'windsor.hassoun@gmail.com',
      'role': 'User',
      'image': 'https://cdn.pixabay.com/photo/2012/04/26/19/47/penguin-42936_640.png',
    },
    {
      'name': 'Sam Hassoun',
      'email': 'windsor.hassoun@gmail.com',
      'role': 'Admin',
      'image': 'https://cdn.pixabay.com/photo/2017/11/06/18/30/eggplant-2924511_640.png',
    },
    {
      'name': 'Sam Hassoun',
      'email': 'windsor.hassoun@gmail.com',
      'role': 'Admin H',
      'image': 'https://cdn.pixabay.com/photo/2013/07/13/11/44/penguin-158551_640.png',
    },
    // Add more users as needed
  ];

  final List<String> roles = ['User', 'Developer', 'Admin', 'Admin H'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Manage Roles',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: users.map((user) {
              return RoleCard(
                name: user['name'],
                email: user['email'],
                role: user['role'],
                image: user['image'],
                roles: roles,
                onRoleChanged: (String? newRole) {
                  setState(() {
                    user['role'] = newRole;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String name;
  final String email;
  final String? role;
  final String image;
  final List<String> roles;
  final ValueChanged<String?> onRoleChanged;

  const RoleCard({
    required this.name,
    required this.email,
    required this.role,
    required this.image,
    required this.roles,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 24,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          DropdownButton<String>(
            value: role,
            dropdownColor: Colors.black,
            style: TextStyle(color: Colors.white),
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: onRoleChanged,
            items: roles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
