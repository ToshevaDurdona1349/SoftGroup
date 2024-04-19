

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/model_news.dart';
import '../../service/NetServiceUsingRetrofit.dart';

part 'techno_event.dart';
part 'techno_state.dart';

class TechnoBloc extends Bloc<TechnoEvent, TechnoState> {
  NetWorkService netWorkService;
  TechnoBloc(this.netWorkService) : super(TechnoInitialState()) {
    on<TechLoadedEvent>((event, emit) async{
      try{

        ModelNews modelNews=await netWorkService.techcrunchNews();
        print("techno Bloc:${modelNews}");
        if(modelNews!=null){
          emit(TechnoSuccesState(modelNews));
        }
        else (TechnoFailureState());

      }
      on Exception catch(_){
        print('e.. ${_}');
        emit(TechnoFailureState());
        rethrow;
      }
    });
  }
}
