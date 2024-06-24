import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:grocery_app/details_screen/details_screen_view.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(4.w),
      children: [
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.w,
            mainAxisSpacing: 2.h,
            childAspectRatio: 0.7,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            homeList.length,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context)=> DetailsScreenView(index: index,)
                      ),
                  );
                },
                child: Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15.px),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                homeList[index].image,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          homeList[index].name,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 22.px,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          homeList[index].type,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 17.px,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
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
                            const Spacer(),
                            IconButton.filled(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20.px,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.grey.shade300)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
