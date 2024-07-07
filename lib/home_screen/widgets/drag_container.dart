import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DragContainer extends StatelessWidget {
  const DragContainer({super.key,required this.bloc});
  final GroceryBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.px)),
        color: Colors.grey.shade400.withOpacity(0.95),
      ),
      child: ListView.separated(
          padding: EdgeInsets.all(15.px),
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: 11.h,
            decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.8),
                borderRadius:
                BorderRadius.circular(20.px)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(15.px),
                    child: Image(
                      fit: BoxFit.cover,
                      width: 20.w,
                      image: AssetImage(
                          bloc.cartList[index].image),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    bloc.cartList[index].name,
                    style: TextStyle(
                      fontSize: 25.px,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 3.h,
          ),
          itemCount: bloc.cartList.length),
    )
        .animate()
        .fade(duration: 500.ms)
        .slideY(begin: 1, end: 0);
  }
}
