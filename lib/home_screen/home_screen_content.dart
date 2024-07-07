import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/home_screen/widgets/is_not_drag_container_and_empty.dart';
import 'package:grocery_app/home_screen/widgets/is_not_drag_container_and_is_not_empty.dart';
import 'package:grocery_app/home_screen/widgets/drag_container.dart';
import 'package:grocery_app/home_screen/widgets/items_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<GroceryBloc>();
    return Stack(
      children: [
        ItemsWidget(bloc: bloc,),
        BlocBuilder<GroceryBloc, GroceryState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onLongPress: () {
                  bloc.add(DragEvent());
                },
                child: bloc.isDrag
                    ? DragContainer(bloc: bloc,)
                    : bloc.cartList.isEmpty
                        ? IsNotDragContainerAndEmpty(bloc: bloc,)
                        : IsNotDragContainerAndIsNotEmpty(bloc: bloc,),
              ),
            );
          },
        ),
      ],
    );
  }
}
