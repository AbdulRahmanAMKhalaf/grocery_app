import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery_app/details_screen/details_screen_content.dart';

class DetailsScreenView extends StatelessWidget {
  const DetailsScreenView({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: DetailsScreenContent(index: index,).animate().then(duration: 200.ms).fadeIn(duration: 800.ms),
    );
  }
}
