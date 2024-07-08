import 'package:flutter/material.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IsNotDragContainerAndEmpty extends StatelessWidget {
  const IsNotDragContainerAndEmpty({super.key,required this.bloc});
  final GroceryBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 9.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.px)),
        color: Colors.transparent,
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(12.px),
          itemBuilder: (context, index) => ClipRRect(
            borderRadius:
            BorderRadius.circular(15.px),
            child: Image(
              fit: BoxFit.cover,
              width: 12.w,
              image: AssetImage(
                  bloc.cartList[index].image),
            ),
          ),
          separatorBuilder: (context, index) =>
              SizedBox(
                width: 3.w,
              ),
          itemCount: bloc.cartList.length),
    );
  }
}
