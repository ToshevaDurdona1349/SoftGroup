

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/model_news.dart';
import '../../service/NetServiceUsingRetrofit.dart';

part 'apple_event.dart';
part 'apple_state.dart';

class AppleBloc extends Bloc<AppleEvent, AppleState> {
  NetWorkService netWorkService;
  AppleBloc(this.netWorkService) : super(AppleInitialState()) {
    on<AppleLoadedEvent>((event, emit) async{
      try{
        ModelNews modelNews=await netWorkService.appleNews(event.from, event.to);
        print("apple Bloc:${modelNews}");
        if(modelNews!=null){
          emit(AppleSuccsesState(modelNews));
        }
        else (AppleFailureState());

      }
      on Exception catch(_){
        print('_${_}');
        emit(AppleFailureState());
        rethrow;
      }
    });
  }
}
