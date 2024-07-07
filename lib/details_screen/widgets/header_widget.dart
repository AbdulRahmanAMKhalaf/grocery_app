import 'package:flutter/material.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.grey.shade600,
                size: 25.px,
              )),
          const Spacer(),
          Text(
            homeList[index].type,
            style: TextStyle(
                fontSize: 22.px,
                fontWeight: FontWeight.w800,
                color: Colors.grey.shade500),
          ),
          const Spacer(),
          IconButton.filled(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Colors.grey.shade300)),
              icon: Icon(
                Icons.shopping_cart,
                size: 20.px,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
