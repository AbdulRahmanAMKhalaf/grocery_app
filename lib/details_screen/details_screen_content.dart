import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/details_screen/widgets/add_to_cart_button.dart';
import 'package:grocery_app/details_screen/widgets/grey_container.dart';
import 'package:grocery_app/details_screen/widgets/plus_minus_widget.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreenContent extends StatelessWidget {
  const DetailsScreenContent({super.key, required this.index});

  final int index;


  @override
  Widget build(BuildContext context) {
    var bloc=context.read<GroceryBloc>();
    bloc.index=index;
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GreyContainer(index: bloc.index,),
              Container(
                height: 56.h,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            homeList[index].name,
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 27.px,
                                fontWeight: FontWeight.w800),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: homeList[index].price,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25.px,
                                  )),
                              TextSpan(
                                  text: '/kg',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.px,
                                  )),
                            ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        homeList[index].text,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.px,
                            height: 0.22.h),
                      ),
                      const Spacer(),
                      AddToCartButton(bloc: bloc,index: bloc.index,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          PlusMinusWidget(index: index),
        ],
      ),
    );
  }
}
