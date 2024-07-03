part of 'grocery_bloc.dart';

abstract class GroceryEvent {}
final class AddToCartEvent extends GroceryEvent{}
final class DragEvent extends GroceryEvent{}