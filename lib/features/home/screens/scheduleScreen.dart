import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Schedules',
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "Today's Schedule",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          ScheduleItem(
            scheduleName: 'Schedule 1',
            timing: '7PM',
          ),
          ScheduleItem(
            scheduleName: 'Schedule 2',
            timing: '8PM',
          ),
          ScheduleItem(
            scheduleName: 'Schedule 3',
            timing: '9PM',
          ),
          SizedBox(height: 20),
          Text(
            'Future Schedules',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          FutureScheduleItem(
            date: '17 Mar, 2024',
            timing: '7PM',
          ),
          FutureScheduleItem(
            date: '29 Mar, 2024',
            timing: '8PM',
          ),
          FutureScheduleItem(
            date: '5 Aug, 2024',
            timing: '9PM',
          ),
          FutureScheduleItem(
            date: '9 Sep, 2024',
            timing: '9PM',
          ),
          FutureScheduleItem(
            date: '11 Oct, 2024',
            timing: '9PM',
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String scheduleName;
  final String timing;

  const ScheduleItem({
    required this.scheduleName,
    required this.timing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  scheduleName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              'Timings: $timing',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureScheduleItem extends StatelessWidget {
  final String date;
  final String timing;

  const FutureScheduleItem({
    required this.date,
    required this.timing,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: Colors.green),
              SizedBox(width: 10),
              Text(
                'Date: $date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            'Timings: $timing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

