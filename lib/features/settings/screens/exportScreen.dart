import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({Key? key}) : super(key: key);

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Export Data',
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
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
                        leading: Icon(Icons.note_alt_rounded, color: Colors.white),
                        title: Text(
                          "Company Data",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing:Icon(Icons.cloud_download,color: Colors.white,)

                    ),
                  ),
                ),
                InkWell(
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
                        leading: Icon(Icons.calculate_sharp, color: Colors.white),
                        title: Text(
                          "Finance",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing:Icon(Icons.cloud_download,color: Colors.white,)

                    ),
                  ),
                ),

                InkWell(
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
                        leading: Icon(Icons.list_alt_sharp, color: Colors.white),
                        title: Text(
                          "Listing",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing:Icon(Icons.cloud_download,color: Colors.white,)

                    ),
                  ),
                ),


              ],

            ),

          ),
        )
    );
  }
}
