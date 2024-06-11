import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Privacy Policy',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum nec odio ipsum. Suspendisse cursus malesuada facilisis. '
                      'Nunc consectetur odio sed dolor efficitur, id tempor quam luctus. '
                      'Cras aliquet sem ut sollicitudin condimentum. Proin vestibulum '
                      'lectus ut quam ornare, sit amet elementum nisl hendrerit. '
                      'Sed eget vehicula libero. Pellentesque et turpis pulvinar, '
                      'congue metus vitae, feugiat risus. Ut euismod purus ac justo '
                      'pretium, id tristique ligula rutrum. Morbi a ultricies eros, '
                      'sit amet consequat dui. Fusce ut placerat orci, ut euismod ipsum. '
                      'Ut suscipit non orci et facilisis. Proin id ullamcorper libero. '
                      'Vestibulum et augue sodales, tempor risus eget, fermentum libero. '
                      'Suspendisse potenti. Vestibulum finibus, neque at iaculis convallis, '
                      'augue diam dictum lorem, non interdum enim nisl sit amet augue. '
                      'Fusce malesuada tortor at eros hendrerit cursus. Quisque dapibus '
                      'arcu at risus sagittis, non tincidunt nunc consequat. Integer '
                      'eleifend interdum purus, sed auctor libero accumsan quis. '
                      'Pellentesque habitant morbi tristique senectus et netus et '
                      'malesuada fames ac turpis egestas.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
