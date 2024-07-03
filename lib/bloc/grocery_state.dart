part of 'grocery_bloc.dart';


abstract class GroceryState {}

final class GroceryInitialState extends GroceryState {}
final class AddLaodingState extends GroceryState{}
final class AddSuccessfullyState extends GroceryState{}
final class AddErrorState extends GroceryState{}
final class DragaodingState extends GroceryState{}
final class DragSuccessfullyState extends GroceryState{}
final class DragErrorState extends GroceryState{}
