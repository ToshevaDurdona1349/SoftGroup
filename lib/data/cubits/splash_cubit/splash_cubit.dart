


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/model/model_news.dart';



part 'splash_state.dart';
enum Status{
  initial,
  loding,
  loaded,
  error}

class SplashCubit extends Cubit<SplashState>{
// boshlang'ich qiymat beerilmoqda
  SplashCubit():super(  SplashState( isEyeShow:false, status:Status.initial,  chekBox:false,  select:''  ));



  void funksiya()async {
    await Future.delayed(Duration(seconds:5),(){
        emit(state.copyWith(status:Status.loaded));
      });

    }

  void onbording()async{

    emit(state.copyWith(status:Status.loding));  //state ning copyWith funksiyasi orqali state ga Loading qiymat beriladi

    await Future.delayed(Duration(seconds:2),(){
      emit(state.copyWith(status:Status.loaded));
      // State ning copyWith funk orqali yana state ga Loaded degan qiymat berildi
     });

  }

  void isShowPassword(bool isShow) async {
    print(isShow);
    emit(state.copyWith(isEyeShow:!isShow));
  }

  void isShowChekbox(bool chekBox1) async {
    print(chekBox1);
    emit(state.copyWith(chekBox:!chekBox1));
  }

  void isShowFollowing(bool following) async {
    emit(state.copyWith(following:!following));
  }
  void isShowSelect(String select) async {
    print(select);
    emit(state.copyWith(select:select));
  }

  void isShowCount(int count) async {
    print(count);
    emit(state.copyWith(count:count));
  }
  Future<void> onChangeOnly({required value1})async{  //xech qanaqa boshlangich qiymat berilmaydi bunda
    emit(state.copyWith(value1A: value1));     // bu joyda return bo'lib kerakli joyga qaytadi
  }
  Future<void> changeMinusDay({required enteringday})async{
    //emit(state.copyWith(textEditC: enteringday));
  }





}