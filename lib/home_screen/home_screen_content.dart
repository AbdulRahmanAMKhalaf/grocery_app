import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/details_screen/details_screen_view.dart';
import 'package:grocery_app/home_model/home_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<GroceryBloc>();
    return Stack(
      children: [
        ListView(
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
                            builder: (context) =>
                                BlocProvider.value(
                                  value: bloc,
                                  child: DetailsScreenView(
                                    index: index,
                                  ),
                                )),
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
                                        text: '/kg',
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
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.grey.shade300)),
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
        ),
        BlocBuilder<GroceryBloc, GroceryState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onLongPress: () {
                  bloc.add(DragEvent());
                },
                child: bloc.isDrag
                    ? Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.px)),
                    color: Colors.grey.shade400.withOpacity(0.95),
                  ),
                  child: ListView.separated(
                      padding: EdgeInsets.all(15.px),
                      itemBuilder: (context, index) =>
                          Container(
                            width: double.infinity,
                            height: 11.h,
                            decoration: BoxDecoration(
                              color: Colors.black87.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20.px)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.px),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: 20.w,
                                      image: AssetImage(bloc.cartList[index].image),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text(bloc.cartList[index].name,
                                    style: TextStyle(fontSize: 25.px,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 3.h,),
                      itemCount: bloc.cartList.length),
                ).animate().fade(duration: 500.ms).slideY(begin: 1,end: 0)
                    : Container(
                  width: double.infinity,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.px)),
                    color: Colors.grey.shade800.withOpacity(0.85),
                  ),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all( 12.px),
                      itemBuilder: (context, index) =>
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.px),
                            child: Image(
                              fit: BoxFit.cover,
                              width: 12.w,
                              image: AssetImage(bloc.cartList[index].image),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 3.w,),
                      itemCount: bloc.cartList.length),
                ).animate().fade(duration: 800.ms).slideY(begin: 1,end: 0),
              ),
            );
          },
        ),
      ],
    );
  }
}
