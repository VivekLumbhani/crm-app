import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.white, fontSize: 18),
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildChoiceChip(0, 'All'),
                SizedBox(width: 5),
                _buildChoiceChip(1, 'Read'),
                SizedBox(width: 5),
                _buildChoiceChip(2, 'Unread'),
                Spacer(),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    "Clear all",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationTile(
                    icon: Icons.chat_outlined,
                    title: "New Message",
                    subtitle: "You have received a new message.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.checklist_rtl_sharp,
                    title: "To-Do",
                    subtitle: "You have a new task to complete.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.people_outlined,
                    title: "Meeting",
                    subtitle: "You have a meeting scheduled.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.calendar_month,
                    title: "Calendar",
                    subtitle: "Check your calendar for new events.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.people_outlined,
                    title: "Meeting",
                    subtitle: "You have a meeting scheduled.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.chat_outlined,
                    title: "New Message",
                    subtitle: "You have received a new message.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.checklist_rtl_sharp,
                    title: "To-Do",
                    subtitle: "You have a new task to complete.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.people_outlined,
                    title: "Meeting",
                    subtitle: "You have a meeting scheduled.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.calendar_month,
                    title: "Calendar",
                    subtitle: "Check your calendar for new events.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.checklist_rtl_sharp,
                    title: "To-Do",
                    subtitle: "You have a new task to complete.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.chat_outlined,
                    title: "New Message",
                    subtitle: "You have received a new message.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.checklist_rtl_sharp,
                    title: "To-Do",
                    subtitle: "You have a new task to complete.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.people_outlined,
                    title: "Meeting",
                    subtitle: "You have a meeting scheduled.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.calendar_month,
                    title: "Calendar",
                    subtitle: "Check your calendar for new events.",
                    time: "2h ago",
                  ),
                  _buildNotificationTile(
                    icon: Icons.checklist_rtl_sharp,
                    title: "To-Do",
                    subtitle: "You have a new task to complete.",
                    time: "2h ago",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white54,
            ),
          ),
        ],
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


