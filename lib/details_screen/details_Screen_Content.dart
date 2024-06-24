import 'package:flutter/material.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreenContent extends StatelessWidget {
  const DetailsScreenContent({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 42.h,
                width: double.infinity,
                color: Colors.grey.shade200,
              child:Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 1000,
                      height: 150,
                      child: Image(
                        image:AssetImage(
                            homeList[index].image
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(2.w),
                    child: Row (
                      children: [
                        IconButton(
                            onPressed:(){
                              Navigator.pop(context);
                            },
                            icon:Icon(Icons.arrow_back_ios_new_outlined,color: Colors.grey.shade600,size: 25.px,)),
                        const Spacer(),
                        Text(homeList[index].type,
                          style: TextStyle(
                              fontSize: 22.px,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.shade500
                          ),
                        ),
                        const Spacer(),
                        IconButton.filled(
                            onPressed: (){},
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.grey.shade300)
                            ),
                            icon:Icon(Icons.shopping_cart,size: 20.px,
                              color: Colors.white,)),
                      ],
                    ),
                  ),
                ],
              ),
              ),
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
                          Text(homeList[index].name,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 27.px,
                            fontWeight: FontWeight.w800
                          ),
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
                                  text: '\/kg',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.px,
                                  )),
                            ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Text(homeList[index].text,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.px,
                        height: 0.22.h
                      ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.px),
                        child: MaterialButton(
                            onPressed:(){},
                          height: 6.h,
                          color: Colors.green.shade400,
                          minWidth: 80.w,
                          child: Center(
                            child: Text('Add to cart',
                            style: TextStyle(
                              fontSize: 20.px,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 13.h),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.px),
                  color: Colors.grey.shade200
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                      onPressed:(){},
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white)
                      ),
                      icon: Icon(Icons.remove,color: Colors.red,size: 25.px,)),
                  SizedBox(width: 1.w,),
                  Text('1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.px,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 1.w,),
                  IconButton.filled(
                      onPressed:(){},
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white)
                      ),
                      icon: Icon(Icons.add,color: Colors.green,size: 25.px,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
