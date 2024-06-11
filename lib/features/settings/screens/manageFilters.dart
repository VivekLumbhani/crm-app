import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageFiltersScreen extends StatefulWidget {
  const ManageFiltersScreen({Key? key}) : super(key: key);

  @override
  State<ManageFiltersScreen> createState() => _ManageFiltersScreenState();
}

class _ManageFiltersScreenState extends State<ManageFiltersScreen> {
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
                        leading: Icon(Icons.type_specimen_sharp, color: Colors.white),
                        title: Text(
                          "Lead Types",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing:Icon(Icons.arrow_drop_down_circle,color: Colors.white,)

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
                          leading: Icon(Icons.multiple_stop_rounded, color: Colors.white),
                          title: Text(
                            "Category",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing:Icon(Icons.arrow_drop_down_circle,color: Colors.white,)

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
                          leading: Icon(Icons.circle_outlined, color: Colors.white),
                          title: Text(
                            "Status",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing:Icon(Icons.arrow_drop_down_circle,color: Colors.white,)

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
