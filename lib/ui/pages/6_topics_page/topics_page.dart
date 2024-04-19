

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(

                centerTitle:true,
                title:Text('Choose your Topics',style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,),),
              ),
              body:Center(
                child:getBody(state,context),
              )
          );
        });
  }

  getBody(SplashState state, BuildContext context) {
    if(state.status==Status.loding){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      return Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child:TextField(

                decoration:InputDecoration(
                    suffixIcon:Icon(Icons.search),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                    ),
                    hintText: "Search"
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              child:Column(
                children: [
                  Expanded(child:Padding(padding:EdgeInsets.only(top:17,),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('National');
                          },
                          borderRadius: BorderRadius.circular(6),
                          child:Container(
                            width: MediaQuery.of(context).size.width/3.2,
                            height: 50,
                            decoration:BoxDecoration(
                               color:state.select=='National'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'National',
                              style: TextStyle(
                                color:state.select=='National'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),
                        SizedBox(
                          width:10,
                        ),

                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('International');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.8,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='International'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'International',
                              style: TextStyle(
                                color:state.select=='International'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),

                        SizedBox(
                          width:10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('Sport');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/4.8,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Sport'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Sport',
                              style: TextStyle(
                                color:state.select=='Sport'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        )

                      ],
                    ),)),
                  Expanded(child:Padding(padding:EdgeInsets.only(top:17),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap:(){
                            context.read<SplashCubit>().isShowSelect('Lifestyle');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/3.2,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Lifestyle'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Lifestyle',
                              style: TextStyle(
                                color:state.select=='Lifestyle'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),
                        SizedBox(
                          width:10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('Business');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.8,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Business'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Business',
                              style: TextStyle(
                                color:state.select=='Business'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),
                        SizedBox(
                          width:10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('Health');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/4.8,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Health'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Health',
                              style: TextStyle(
                                color:state.select=='Health'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        )
                      ],
                    ),)),
                  Expanded(child:Padding(padding:EdgeInsets.only(top:17),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){
                            context.read<SplashCubit>().isShowSelect('Fashion');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/3.2,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Fashion'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Fashion',
                              style: TextStyle(
                                color:state.select=='Fashion'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),
                        SizedBox(width:10,),
                       InkWell(
                         borderRadius: BorderRadius.circular(6),
                         onTap: (){
                           context.read<SplashCubit>().isShowSelect('Technology');
                         },
                         child:  Container(
                           width: MediaQuery.of(context).size.width/2.8,
                           height: 50,
                           decoration:BoxDecoration(
                               color:state.select=='Technology'?Color(0xFF1877F2):Colors.white,
                               borderRadius: BorderRadius.circular(6),
                               border: Border.all(width: 1, color: Color(0xFF1877F2))
                           ),
                           child:Center(child: Text(
                             'Technology',
                             style: TextStyle(
                               color:state.select=='Technology'?Colors.white:Color(0xFF1877F2),
                               fontSize: 16,
                               fontWeight: FontWeight.w600,
                             ),
                           ),),
                         ),
                       )
                      ],
                    ),)),
                  Expanded(child:Padding(padding:EdgeInsets.only(top:17),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){ context.read<SplashCubit>().isShowSelect('Science');},
                          child: Container(
                            width: MediaQuery.of(context).size.width/3.2,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Science'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Science',
                              style: TextStyle(
                                color:state.select=='Science'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(onTap: (){
                          context.read<SplashCubit>().isShowSelect('Art');
                        },
                          borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 73,
                          height: 50,
                          decoration:BoxDecoration(
                              color:state.select=='Art'?Color(0xFF1877F2):Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 1, color: Color(0xFF1877F2))
                          ),
                          child:Center(child: Text(
                            'Art',
                            style: TextStyle(
                              color:state.select=='Art'?Colors.white:Color(0xFF1877F2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),),
                        ),),
                        SizedBox(width: 10,),
                        InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: (){context.read<SplashCubit>().isShowSelect('Politics');},
                          child: Container(
                            width: 107,
                            height: 50,
                            decoration:BoxDecoration(
                                color:state.select=='Politics'?Color(0xFF1877F2):Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(width: 1, color: Color(0xFF1877F2))
                            ),
                            child:Center(child: Text(
                              'Politics',
                              style: TextStyle(
                                color:state.select=='Politics'?Colors.white:Color(0xFF1877F2),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),),
                          ),
                        )
                      ],
                    ),)),

                ],
              ),
            ),


               SizedBox(
                 height:MediaQuery.of(context).size.height/2.5,
               ),


               MaterialButton(
                padding:EdgeInsets.zero,
                shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(6)
                ),
                onPressed:(){
                  Navigator.pushReplacementNamed(context, '/newsPage');
                },
                child: Container(
                  width: 380,
                  height: 50,
                  decoration:BoxDecoration(
                      color: Colors.blue,
                      borderRadius:BorderRadius.circular(6)
                  ),
                  child:Center(child:Text('Next',style:TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,),),),
                ),),


          ],
        ),
      ) ;
    }
  }
}
