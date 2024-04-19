part of 'all_bloc.dart';

@immutable
abstract class AllState {}

class AllInitialState extends AllState {}
class AllSuccsesState extends AllState {
 final ModelNews modelNews;

  AllSuccsesState(this.modelNews);
}
class AllFailureState extends AllState {}
