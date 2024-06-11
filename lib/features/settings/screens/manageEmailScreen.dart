import 'package:crm_app/features/settings/screens/birthMail.dart';
import 'package:crm_app/features/settings/screens/sentEmails.dart';
import 'package:flutter/material.dart';

class ManageEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Manage Email',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'B\'Day Mail'),
              Tab(text: 'User'),
              Tab(text: 'Email Sent'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SentEmails(),
            UserScreen(),
            BirthDayMailScreen(),

          ],
        ),
      ),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  int _selectedIndex = 0;
  final List<Map<String, String?>> _users = [
    {'name': 'Annam Sindam', 'email': 'rfisbai@yahoo.com'},
    {'name': 'Annam Sindam', 'email': 'chelseynoblemontour@gmail.com'},
    {'name': 'Annam Sindam', 'email': 'rfisbai@yahoo.com'},
    {'name': 'Annam Sindam', 'email': 'rfisbai@yahoo.com'},
    {'name': 'Annam Sindam', 'email': 'rfisbai@yahoo.com'},
    {'name': 'Annam Sindam', 'email': 'rfisbai@yahoo.com'},
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
        final name = user['name']?.toLowerCase() ?? '';
        final email = user['email']?.toLowerCase() ?? '';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildChoiceChip(0, 'All'),
                    _buildChoiceChip(1, 'Email'),
                    _buildChoiceChip(2, 'Phone'),
                  ],
                ),
              ),
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
                    Text('Check All', style: TextStyle(color: Colors.white)),
                    Expanded(
                      child: Text('Name', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      child: Text('Email', style: TextStyle(color: Colors.white)),
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
                          leading: StatefulCheckbox(),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(user['name'] ?? '', style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(user['email'] ?? '', style: TextStyle(color: Colors.white)),
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



  Widget _buildChoiceChip(int index, String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedIndex == index,
      onSelected: (bool selected) {
        setState(() {
          _selectedIndex = selected ? index : _selectedIndex;
        });
      },
      backgroundColor: Colors.black,
      selectedColor: Colors.blue,
      labelStyle: TextStyle(
        color: _selectedIndex == index ? Colors.white : Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

}

class StatefulCheckbox extends StatefulWidget {
  @override
  _StatefulCheckboxState createState() => _StatefulCheckboxState();
}

class _StatefulCheckboxState extends State<StatefulCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
      },
      activeColor: Colors.blue,
      checkColor: Colors.white,
    );
  }

}