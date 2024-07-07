import 'package:flutter/material.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key,required this.bloc,required this.index});
final GroceryBloc bloc;
final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.px),
        child: MaterialButton(
          onPressed: () {
            bloc.add(AddToCartEvent());
            Navigator.pop(context);
          },
          height: 6.h,
          color: Colors.green.shade400,
          minWidth: 80.w,
          child: Center(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 20.px,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
