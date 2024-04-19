

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/model_news.dart';
import '../../service/NetServiceUsingRetrofit.dart';

part 'tesla_event.dart';
part 'tesla_state.dart';

class TeslaBloc extends Bloc<TeslaEvent, TeslaState> {
  NetWorkService netWorkService;
  TeslaBloc(this.netWorkService) : super(TeslaInitialState()) {
    on<TeslaLoadedEvent>((event, emit) async{
      try{
        ModelNews modelNews=await netWorkService.teslaNews(event.from);
        print("tesla Bloc:${modelNews}");

        if(modelNews!=null){
          emit(TeslaSuccestate(modelNews));
        }
        else (TeslaFailureState());

      }
      on Exception catch(_){
        print('e// ${_}');
        emit(TeslaFailureState());
        rethrow;
      }
    });
  }
}
