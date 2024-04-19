import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      bloc: context.read<SplashCubit>()..funksiya(),
       listener: (context,state){
       if(state.status==Status.loaded){
          Navigator.pushReplacementNamed(context,'/pageView');
       }
      },
     child: Scaffold(
       body:Center(
         child: Image.asset('assets/0splash_page/bosh.png'),
       ),
     ),
    );
  }
}