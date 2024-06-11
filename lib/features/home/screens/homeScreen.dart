import 'package:crm_app/features/auth/screens/login.dart';
import 'package:crm_app/features/home/widgets/homewidgets.dart';
import 'package:crm_app/features/notification/screens/notificationScreen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<int> salesData1 = [10000, 20000, 30000, 25000, 15000];
  final List<int> salesData2 = [15000, 25000, 35000, 20000, 10000];

  int _selectedIndex = 0;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];
  late int currentPage;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    currentPage = 0;

    tabController.addListener(() {
      setState(() {
        currentPage = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<bool> showMinusIcons = [false, false, false];

  void toggleMinusIcon(int index) {
    setState(() {
      showMinusIcons[index] = !showMinusIcons[index];
    });
  }

  bool isUserRowVisible = false;
  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.black
        : Colors.white;

    void showDeleteConfirmationDialog(BuildContext context, String userName) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Delete User',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Are you sure, you want to delete the user $userName?',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    Text(
                      'Also delete the data associated',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text('Delete'),
                      onPressed: () {
                        // Perform delete action
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                // User scrolled up
                // Show the user row
                setState(() {
                  isUserRowVisible = true;
                });
                print("Scrolled Up"); // For debugging purposes
              } else if (notification.direction == ScrollDirection.reverse) {
                // User scrolled down
                // Hide the user row
                // isUserRowVisible=false;

                print("Scrolled Down"); // For debugging purposes
              }
              return true; // Consume the notification
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCg3ECfhNnwn30E2r5J-Sb2UphwWfflyqgeA&s'), // Replace with actual image
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Angella',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            'Hi mam, Good to see ya',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          Get.to(NotificationScreen());
                        },
                        icon: Icon(Icons.notifications, color: Colors.white),
                      ),
                      PopupMenuButton<String>(
                        // icon: Icon(Icons.line_weight_sharp, color: Colors.white),
                        color: Colors
                            .black, // Set the background color of the menu
                        icon:
                            Icon(Icons.line_weight_sharp, color: Colors.white),
                        onSelected: (String result) {
                          setState(() {
                            print(result);
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Listing',
                            child: Text('Listing',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Finance',
                            child: Text('Finance',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Company',
                            child: Text('Company',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: isUserRowVisible,
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildCreateLead(),
                            SizedBox(width: 20),
                            buildUserCard(
                              'Mike',
                              'Hr mgr',
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCg3ECfhNnwn30E2r5J-Sb2UphwWfflyqgeA&s',
                              trailingIcon: showMinusIcons[0]
                                  ? IconButton(
                                      icon: Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () =>
                                          showDeleteConfirmationDialog(
                                              context, 'Mike'),
                                    )
                                  : null,
                            ),
                            SizedBox(width: 20),
                            buildUserCard(
                              'Smith',
                              'Project mgr',
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCg3ECfhNnwn30E2r5J-Sb2UphwWfflyqgeA&s',
                              trailingIcon: showMinusIcons[1]
                                  ? IconButton(
                                      icon: Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () =>
                                          showDeleteConfirmationDialog(
                                              context, 'Mike'),
                                    )
                                  : null,
                            ),
                            SizedBox(width: 20),
                            buildUserCard(
                              'Lucy',
                              'Team Lead',
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCg3ECfhNnwn30E2r5J-Sb2UphwWfflyqgeA&s',
                              trailingIcon: showMinusIcons[2]
                                  ? IconButton(
                                      icon: Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () =>
                                          showDeleteConfirmationDialog(
                                              context, 'Lucy'),
                                    )
                                  : null,
                            ),
                            buildDustbinIconButton(() {
                              setState(() {
                                showMinusIcons = [
                                  true,
                                  true,
                                  true
                                ]; // Update all cards to show minus icon
                              });
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Leads',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildChoiceChip(0, 'All'),
                        SizedBox(width: 5),
                        _buildChoiceChip(1, 'Team Lead'),
                        SizedBox(width: 5),
                        _buildChoiceChip(2, 'My Clients'),
                        SizedBox(width: 5),
                        _buildChoiceChip(3, 'Paid Lead'),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount:
                        MediaQuery.of(context).size.width < 600 ? 2 : 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      working('Needs Work', "assets/Rectangle 1.png", '28'),
                      working('Showing', "assets/Rectangle 2.png", '13'),
                      working('Offer', "assets/Rectangle 3.png", '12'),
                      working('Closed', "assets/Rectangle 4.png", '18'),
                    ],
                  ),
                  Text(
                    'Sales',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 35.0), // Adjust padding as needed

                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 50000,
                                minY: 0,
                                borderData: FlBorderData(show: false),
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 10000,
                                  getDrawingHorizontalLine: (value) {
                                    if (value % 10000 == 0 &&
                                        value >= 10000 &&
                                        value < 50000) {
                                      return FlLine(
                                        color: Colors.grey.withOpacity(0.5),
                                        strokeWidth: 1,
                                      );
                                    } else {
                                      return FlLine(
                                        color: Colors.grey.withOpacity(0.2),
                                        strokeWidth: 1,
                                      );
                                    }
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 10000,
                                      getTitlesWidget: (value, meta) {
                                        if (value % 10000 == 0 &&
                                            value <= 50000 &&
                                            value >= 10000) {
                                          return Text(
                                            '${value ~/ 1000}k',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                barGroups: List.generate(
                                  salesData1.length,
                                  (index) => BarChartGroupData(
                                    x: index,
                                    barRods: [
                                      BarChartRodData(
                                        toY: salesData1[index].toDouble(),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        color: const Color(0xFF5CC8BE),
                                        width: 12,
                                      ),
                                      BarChartRodData(
                                        toY: salesData2[index].toDouble(),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        color: const Color(0xFF357AF6),
                                        width: 12,
                                      ),
                                    ],
                                    barsSpace: 4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget working(String text, String image, String number) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        return Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.43,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: screenHeight * 0.013,
                  left: screenWidth * 0.01,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        letterSpacing: 0.4),
                  ),
                ),

                Positioned(
                  left: screenWidth * 0.149,
                  top: screenHeight * 0.022,
                  child: Image.asset(
                    'assets/Shape.png',
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.25,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.077,
                  left: screenWidth * 0.022,
                  child: Text(
                    number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 38.0,
                        letterSpacing: 0,
                        fontFamily: 'DMSans'),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.142,
                  left: screenWidth * 0.035,
                  child: RichText(
                    text: const TextSpan(
                      text: '+',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: '2',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '%',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' prv last week',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
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
