part of 'techno_bloc.dart';

@immutable
abstract class TechnoState {}

class TechnoInitialState extends TechnoState {}
class TechnoSuccesState extends TechnoState {
  final ModelNews data;
  TechnoSuccesState(this.data);
}
class TechnoFailureState extends TechnoState{}