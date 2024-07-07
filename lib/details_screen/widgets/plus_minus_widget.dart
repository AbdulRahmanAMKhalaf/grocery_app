import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlusMinusWidget extends StatelessWidget {
  const PlusMinusWidget({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.px),
            color: Colors.grey.shade200),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor:
                    WidgetStatePropertyAll(Colors.white)),
                icon: Icon(
                  Icons.remove,
                  color: Colors.red,
                  size: 25.px,
                )),
            SizedBox(
              width: 1.w,
            ),
            Text(
              '1',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.px,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            IconButton.filled(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor:
                    WidgetStatePropertyAll(Colors.white)),
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 25.px,
                ))
          ],
        ),
      ),
    );
  }
}
