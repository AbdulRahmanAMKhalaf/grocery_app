import 'package:flutter/material.dart';
import 'package:grocery_app/details_screen/details_Screen_Content.dart';

class DetailsScreenView extends StatelessWidget {
  const DetailsScreenView({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: DetailsScreenContent(index: index,),
    );
  }
}
