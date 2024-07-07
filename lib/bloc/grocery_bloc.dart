import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/cart_model/cart_model.dart';
import 'package:grocery_app/home_model/home_model.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitialState()) {
    on<AddToCartEvent>(_addToCartEvent);
    on<DragEvent>(_dragEvent);
  }
  int index=0;
  bool isDrag = false;
  List<CartModel>cartList=[];
  FutureOr<void> _addToCartEvent(AddToCartEvent event, Emitter<GroceryState> emit) {
  emit(AddLaodingState());
  cartList.add(CartModel(image: homeList[index].image, name: homeList[index].name));
  emit(AddSuccessfullyState());

  }

  FutureOr<void> _dragEvent(DragEvent event, Emitter<GroceryState> emit) {
    emit(DragaodingState());
    isDrag=!isDrag;
    emit(DragSuccessfullyState());
  }
}
