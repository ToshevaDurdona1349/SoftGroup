part of 'tesla_bloc.dart';

@immutable
abstract class TeslaEvent {}
class TeslaLoadedEvent extends TeslaEvent{
  final String from;
  TeslaLoadedEvent(this.from);
}