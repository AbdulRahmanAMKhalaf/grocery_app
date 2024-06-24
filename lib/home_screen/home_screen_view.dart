import 'package:flutter/material.dart';
import 'package:grocery_app/home_screen/home_screen_content.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning',
            style: TextStyle(
              fontSize: 15.px,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,

            ),
            ),
            Text('Carlos Darras',
              style: TextStyle(
                fontSize: 17.px,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,

              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding:EdgeInsets.only(right: 2.w),
            child: CircleAvatar(
              radius: 27.px,
              foregroundImage: const AssetImage(
                'Assets/images/carlso.jpg'
              ),
            ),
          ),
        ],
      ),
      body: const HomeScreenContent(),
    );
  }
}
