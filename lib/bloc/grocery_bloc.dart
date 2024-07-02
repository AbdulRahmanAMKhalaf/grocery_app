import 'dart:async';

import 'package:bloc/bloc.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitialState()) {
    on<AddToCartEvent>(_addToCartEvent);
  }
  int index=0;
  FutureOr<void> _addToCartEvent(AddToCartEvent event, Emitter<GroceryState> emit) {
  emit(AddLaodingState());

  }
}
