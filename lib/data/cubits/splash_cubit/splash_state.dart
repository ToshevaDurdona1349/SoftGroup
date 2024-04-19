part of 'splash_cubit.dart';

class SplashState {
  final Status? status;
  final bool? isEyeShow;
  final bool? following;
  final bool? chekBox;
   int count;
  final String? select;
  final int? value1;


  SplashState({
    this.status,
    this.isEyeShow = false,
    this.chekBox = false,
     this.count=0,
    this.select='',
    this.value1=0,
    this.following=false

  });

  SplashState copyWith({
    Status? status,
    bool? isEyeShow,
    bool? chekBox,
    int? count,
    String? select,
    ModelNews? modelNews,
    int? value1A,   // bunda ValueA SplashState ning copyWith funcsiyasini maydoni
    bool? following
  }) {
    return SplashState(
      status: status ?? this.status,
      isEyeShow: isEyeShow ?? this.isEyeShow,
      chekBox: chekBox ?? this.chekBox,
      count: count ?? this.count,
      select: select ?? this.select,
      value1: value1A ?? this.value1, //funcsiyasi orqali qiymat berilgan bolsa, classni maydonini shu funksiya orqali cantructor yordami bilan to'ldiradi
      following: following ?? this.following
    );                               /* aks xolda qiymat berilmagan bo'lsa, constructor orqali oladi  */
  }
}
