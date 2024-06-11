import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

            GridView.count(
            crossAxisCount:
            MediaQuery.of(context).size.width < 600 ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double screenHeight = MediaQuery.of(context).size.height;
                    double screenWidth = MediaQuery.of(context).size.width;

                    return Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/bigCard.png",
                              height: screenHeight * 0.3,
                              width: screenWidth * 0.43,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              top: screenHeight * 0.013,
                              left: screenWidth * 0.01,
                              child: Text(
                                "Total Leads",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    letterSpacing: 0.4),
                              ),
                            ),



                            Positioned(
                              top: screenHeight * 0.077,
                              left: screenWidth * 0.022,
                              child: Text(
                                "28",
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
                ),

                working('Hot Leads', "assets/greenCard.png", '13'),

              ],
            )
          ],
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

}
