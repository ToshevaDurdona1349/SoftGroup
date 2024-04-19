part of 'apple_bloc.dart';

@immutable
abstract class AppleEvent {}
class AppleLoadedEvent extends AppleEvent{
  final String from;
  final String to;

  AppleLoadedEvent(this.from, this.to);
}