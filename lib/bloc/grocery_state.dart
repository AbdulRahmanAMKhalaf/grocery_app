part of 'grocery_bloc.dart';


abstract class GroceryState {}

final class GroceryInitialState extends GroceryState {}
final class AddLaodingState extends GroceryState{}
final class AddSuccessfullyState extends GroceryState{}
final class AddErrorState extends GroceryState{}
