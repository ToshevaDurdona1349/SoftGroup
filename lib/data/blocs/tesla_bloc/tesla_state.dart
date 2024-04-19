part of 'tesla_bloc.dart';

@immutable
abstract class TeslaState {}

class TeslaInitialState extends TeslaState {}
class TeslaSuccestate extends TeslaState {
  final ModelNews data;
  TeslaSuccestate(this.data);
}
class TeslaFailureState extends TeslaState{}
