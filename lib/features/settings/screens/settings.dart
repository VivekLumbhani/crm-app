import 'package:crm_app/features/settings/screens/ChatSetting.dart';
import 'package:crm_app/features/settings/screens/exportScreen.dart';
import 'package:crm_app/features/settings/screens/manageEmailScreen.dart';
import 'package:crm_app/features/settings/screens/manageFilters.dart';
import 'package:crm_app/features/settings/screens/manageRoles.dart';
import 'package:crm_app/features/settings/screens/passwordManagement.dart';
import 'package:crm_app/features/settings/screens/privacyPolicy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
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
                    leading: Icon(CupertinoIcons.bell, color: Colors.white),
                    title: Text(
                      "Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing:         Switch(
                      value: notification,
                      onChanged: (bool value) {
                        setState(() {
                          notification = value;
                        });
                      },
                    ),

                  ),
                ),
              ),
              _buildSettingsTile(
                icon: Icons.settings,
                title: 'Manage Roles',
                onTap: () {
                  Get.to(ManageRolesScreen());

                },
              ),
              _buildSettingsTile(
                icon: Icons.account_circle,
                title: 'Switch Accounts',
                onTap: () {
                  switchAccounts(context);
                },
              ),
              _buildSettingsTile(
                icon: Icons.email,
                title: 'Manage Email',
                onTap: () {
                  Get.to(ManageEmailScreen());
                },
              ),
              _buildSettingsTile(
                icon: Icons.filter_alt,
                title: 'Manage Filters',
                onTap: () {
                  Get.to(ManageFiltersScreen());
                },
              ),
              _buildSettingsTile(
                icon: Icons.vpn_key,
                title: 'Password Manager',
                onTap: () {
                  Get.to(PasswordManagementScreen());
                },
              ),
              _buildSettingsTile(
                icon: Icons.import_export,
                title: 'Export Data',
                onTap: () {
                  Get.to(ExportScreen());
                },
              ),
              _buildSettingsTile(
                icon: Icons.chat,
                title: 'Chats',
                onTap: () {
                  Get.to(ChatSettingScreen());
                },
              ),
              _buildSettingsTile(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                onTap: () {
                  Get.to(PrivacyPolicyScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],

          border: Border.all(color: Colors.black12), // Border color
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        margin: EdgeInsets.symmetric(vertical: 8), // Vertical spacing between tiles
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ),
    );
  }



  void switchAccounts(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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
          child: Wrap(
            children: <Widget>[
              SizedBox(height: 10,),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(bottom: 16),
                    ),
                    Text(
                      'Switch Account',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              _buildAccountItem('Lynda Runte', 'Lynda_Runte@gmail.com', 'User', 'https://cdn.pixabay.com/photo/2013/07/13/11/44/penguin-158551_640.png',false),
              _buildAccountItem('Santos Watsica', 'Santos_Wat77@gmail.com', 'Client','https://cdn.pixabay.com/photo/2017/11/06/18/30/eggplant-2924511_640.png',true),
              _buildAccountItem('Phillip McClure', 'Phillip33@yahoo.com', 'Admin','https://cdn.pixabay.com/photo/2012/04/26/19/47/penguin-42936_640.png',false),



              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  trailing: Icon(Icons.add_circle_outline, color: Colors.white),
                  title: Text(
                    'Add New Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle add new account action
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  Widget _buildAccountItem(String name, String email, String role,String imgUrl,bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        title: Text(name,style: TextStyle(color: Colors.white),),
        subtitle: Text(email,style: TextStyle(color: Colors.white),),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            role,
            style: TextStyle(color: Colors.black),
          ),
        ),
        onTap: () {
          // Handle account switch action
        },
      ),
    );
  }
}
