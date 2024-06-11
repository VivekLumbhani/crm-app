import 'package:flutter/material.dart';

class BirthDayMailScreen extends StatefulWidget {
  const BirthDayMailScreen({Key? key}) : super(key: key);

  @override
  State<BirthDayMailScreen> createState() => _BirthDayMailScreenState();
}

class _BirthDayMailScreenState extends State<BirthDayMailScreen> {
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  TextEditingController bodyController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.format_bold,
                        color: isBold ? Colors.green : Colors.white),
                    onPressed: () {
                      setState(() {
                        isBold = !isBold;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.format_italic,
                        color: isItalic ? Colors.green : Colors.white),
                    onPressed: () {
                      setState(() {
                        isItalic = !isItalic;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.format_underline,
                        color: isUnderline ? Colors.green : Colors.white),
                    onPressed: () {
                      setState(() {
                        isUnderline = !isUnderline;
                      });
                    },
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: 'Normal',
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: <String>['Normal', 'Header', 'Title']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  SizedBox(width: 10),
                  DropdownButton<int>(
                    dropdownColor: Colors.black,
                    value: 16,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: <int>[16, 18, 20, 22, 24].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {},
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Font',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: subjectController,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                      decoration: isUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Subject here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200, // Set the desired height here
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bodyController,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                      decoration: isUnderline
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Start Typing...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),

                  ),
                  onPressed: () {

                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
