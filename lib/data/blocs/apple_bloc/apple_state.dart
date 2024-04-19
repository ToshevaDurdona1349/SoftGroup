part of 'apple_bloc.dart';

@immutable
abstract class AppleState {}


class AppleInitialState extends AppleState {}
class AppleSuccsesState extends AppleState {
  ModelNews modelNews;

  AppleSuccsesState(this.modelNews);
}
class AppleFailureState extends AppleState {}