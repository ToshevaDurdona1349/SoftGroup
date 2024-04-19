

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';

import '../../model/model_news.dart';

part 'all_event.dart';
part 'all_state.dart';

class AllBloc extends Bloc<AllEvent, AllState> {

  NetWorkService netWorkService;
  AllBloc(this.netWorkService) : super(AllInitialState()) {
    on<AllLoadedEvent>((event, emit) async{
      try{
        ModelNews modelNews=await netWorkService.allNews();
        print("all Bloc:${modelNews}");
        if(modelNews!=null){
          emit(AllSuccsesState(modelNews));
        }
        else (AllFailureState());

      }
      on Exception catch(_){
        print('_${_}');
        emit(AllFailureState());
        rethrow;
      }
    });
  }
}
