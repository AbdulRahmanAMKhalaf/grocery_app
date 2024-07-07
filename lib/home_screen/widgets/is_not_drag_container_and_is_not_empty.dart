import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IsNotDragContainerAndIsNotEmpty extends StatelessWidget {
  const IsNotDragContainerAndIsNotEmpty({super.key,required this.bloc});
final GroceryBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Item',
      child: Container(
        width: double.infinity,
        height: 9.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.px)),
          color: Colors.grey.shade600.withOpacity(0.85),
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(12.px),
            itemBuilder: (context, index) => ClipRRect(
              borderRadius:
              BorderRadius.circular(15.px),
              child: Image(
                fit: BoxFit.cover,
                width: 14.w,
                image: AssetImage(
                    bloc.cartList[index].image),
              ),
            ),
            separatorBuilder: (context, index) =>
                SizedBox(
                  width: 3.w,
                ),
            itemCount: bloc.cartList.length),
      )
          .animate()
          .fade(duration: 800.ms)
          .slideY(begin: 1, end: 0),
    );
  }
}
