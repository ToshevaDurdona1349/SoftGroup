

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class VertificationPage extends StatelessWidget {
   VertificationPage({super.key});

  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
              appBar: AppBar(

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
        child:PageView(
          controller:pageController,
         physics:NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding:EdgeInsets.only(left:24,right:24),
              child:Column(
                children: [
                  Text('OTP Verification',style:TextStyle(color: Color(0xFF4E4B66),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,),),
                  SizedBox(
                    height:8,
                  ),
                  Text('Enter the OTP sent to +67-1234-5678-9',style:TextStyle(color: Color(0xFF4E4B66),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),),

                 SizedBox(
                   height:27,
                 ),
                 Row(
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [
                     Container(
                       width: 64,
                       height: 64,
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(6),
                           border:Border.all(width:2,color: Color(0xFF4E4B66))
                       ),
                     ),
                     SizedBox(width:16,),
                     Container(
                       width: 64,
                       height: 64,
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(6),
                           border:Border.all(width:2,color: Color(0xFF4E4B66))
                       ),
                     ),
                     SizedBox(width:16,),
                     Container(
                       width: 64,
                       height: 64,
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(6),
                           border:Border.all(width:2,color: Color(0xFF4E4B66))
                       ),
                     ),
                     SizedBox(width:16,),
                     Container(
                       width: 64,
                       height: 64,
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(6),
                           border:Border.all(width:2,color: Color(0xFF4E4B66))
                       ),
                     ),
                   ],
                 ),
                  SizedBox(
                    height:27,
                  ),
                  Text.rich(
                      TextSpan(
                          children:[
                            TextSpan(
                                text: 'Resend code in ',
                                style: TextStyle(
                                  color: Color(0xFF4E4B66),
                                  fontSize: 14,
                                )
                            ),
                            TextSpan(
                                text: '56s',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )
                            )
                          ]
                      )
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/2,
                  ),
                  MaterialButton(
                    padding:EdgeInsets.zero,
                    shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(6)
                    ),
                    onPressed:(){
                      pageController.jumpToPage(1);
                    },
                    child: Container(
                      width: 380,
                      height: 50,
                      decoration:BoxDecoration(
                          color: Colors.blue,
                          borderRadius:BorderRadius.circular(6)
                      ),
                      child:Center(child:Text('Verify',style:TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,),),),
                    ),)
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.only(left:24,right:24),
              child:ListView(
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('Reset',style:TextStyle(fontSize: 32,
                        fontWeight: FontWeight.w700,),),
                      Text('Password',style:TextStyle(fontSize: 32,
                        fontWeight: FontWeight.w700,),),

                      SizedBox(
                        height:13,
                      ),
                      Text.rich(
                          TextSpan(
                              children:[
                                TextSpan(
                                    text: 'New Password',
                                    style: TextStyle(
                                      color: Color(0xFF4E4B66),
                                      fontSize: 14,
                                    )
                                ),
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    )
                                )
                              ]
                          )
                      ),

                      Container(
                        child:TextField(
                          decoration:InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              )
                          ),
                        ),
                      ),

                      SizedBox(
                        height:13,
                      ),

                      Text.rich(
                          TextSpan(
                              children:[
                                TextSpan(
                                    text: 'Confirm new password',
                                    style: TextStyle(
                                      color: Color(0xFF4E4B66),
                                      fontSize: 14,
                                    )
                                ),
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    )
                                )
                              ]
                          )
                      ),

                      Container(
                        child:TextField(
                          decoration:InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                              )
                          ),
                        ),
                      ),

                      SizedBox(
                        height:MediaQuery.of(context).size.height/2.45,
                      ),
                      MaterialButton(
                        padding:EdgeInsets.zero,
                        shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(6)
                        ),
                        onPressed:(){
                          pageController.jumpToPage(2);
                        },
                        child: Container(
                          width: 380,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.blue,
                              borderRadius:BorderRadius.circular(6)
                          ),
                          child:Center(child:Text('Submit',style:TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,),),),
                        ),)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.only(left:24,right:24),
              child:Column(
                children: [
                  SizedBox(
                    height:150,
                  ),
                 Image.asset('assets/0splash_page/bosh.png'),
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: Color(0xFF4E4B66),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Your account is ready to use',
                    style: TextStyle(
                      color: Color(0xFF4E4B66),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/3.8,
                  ),
                  MaterialButton(
                    padding:EdgeInsets.zero,
                    shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(6)
                    ),
                    onPressed:(){
                      Navigator.pushNamed(context, '/SelectCountryPage');
                    },
                    child: Container(
                      width:380,
                      height: 50,
                      decoration:BoxDecoration(
                          color: Colors.blue,
                          borderRadius:BorderRadius.circular(6)
                      ),
                      child:Center(child:Text('Go to Homepage',style:TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,),),),
                    ),)
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
