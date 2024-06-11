import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentEmails extends StatefulWidget {
  const SentEmails({Key? key}) : super(key: key);

  @override
  State<SentEmails> createState() => _SentEmailsState();
}

class _SentEmailsState extends State<SentEmails> {
  final List<Map<String, String?>> _users = [
    {'subject': 'Bday', 'user': 'Annam Sindam', 'senton': 'rfisbai@yahoo.com'},
    {'subject': 'meeting', 'user': 'Annam Sindam', 'senton': 'chelseynoblemontour@gmail.com'},
    {'subject': 'party', 'user': 'Annam Sindam', 'senton': 'rfisbai@yahoo.com'},
    {'subject': 'Bday', 'user': 'Annam Sindam', 'senton': 'rfisbai@yahoo.com'},
    {'subject': 'Bday', 'user': 'Annam Sindam', 'senton': 'rfisbai@yahoo.com'},
    {'subject': 'meeting', 'user': 'Annam Sindam', 'senton': 'rfisbai@yahoo.com'},
  ];

  List<Map<String, String?>> _filteredUsers = [];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
  }

  void _filterUsers(String query) {
    setState(() {
      _searchQuery = query;
      _filteredUsers = _users.where((user) {
        final name = user['senton']?.toLowerCase() ?? '';
        final email = user['user']?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase()) || email.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: _filterUsers,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Search Users...',
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Subject', style: TextStyle(color: Colors.white))),
                    Expanded(
                      child: Text('Sent On', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      child: Text('Users', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = _filteredUsers[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(user['subject'] ?? '', style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(user['senton'] ?? '', style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(user['user'] ?? '', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.white24),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
