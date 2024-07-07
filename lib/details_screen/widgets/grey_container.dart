import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery_app/details_screen/widgets/header_widget.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GreyContainer extends StatelessWidget {
  const GreyContainer({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 42.h,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 1000,
              height: 150,
              child: Hero(
                tag: '${homeList[index].name}cartTag',
                transitionOnUserGestures: true,
                child: Image(
                  image: AssetImage(homeList[index].image),
                ),
              ),
            ),
          ).animate().shimmer().then().scale().shake(),
          HeaderWidget(index: index),
        ],
      ),
    );
  }
}
