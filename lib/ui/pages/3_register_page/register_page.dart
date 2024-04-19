

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';


class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
              body:Center(
                child:getBody(state,context),
              )
          );
        });
  }
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  getBody(SplashState state, BuildContext context) {
    if(state.status==Status.loding){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      return Container(
        padding: EdgeInsets.only(left:24,right: 24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:25,
                ),
                Container(
                  height:155,
                  width:379,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello!',style: TextStyle(fontWeight:FontWeight.w700,letterSpacing: 0.12,fontSize: 48,color: Colors.blue),),
                      Text('Signup to get Started',style: TextStyle(color: Color(0xFF4E4B66),fontSize: 20,fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),

                Text.rich(
                    TextSpan(
                        children:[
                          TextSpan(
                              text: 'Username',
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
                SizedBox(
                  height:4,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please enter some username';
                            }
                            return null;

                          },
                          decoration:InputDecoration(
                              hintText: 'Password',
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),

                        )
                      ],
                    )),
                SizedBox(height:16,),

                Text.rich(
                    TextSpan(
                        children:[
                          TextSpan(
                              text: 'Email',
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
                SizedBox(
                  height:4,
                ),
                Form(
                    key: _formKey1,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please enter some email';
                            }
                            return null;

                          },
                          decoration:InputDecoration(
                              hintText: 'Email',
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),

                        )
                      ],
                    )),
                SizedBox(height:16,),

                Text.rich(
                    TextSpan(
                        children:[
                          TextSpan(
                              text: 'Bio',
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
                SizedBox(
                  height:4,
                ),
                Form(
                    key: _formKey2,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please enter some bio';
                            }
                            return null;

                          },
                          decoration:InputDecoration(
                              hintText: 'Bio',
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),

                        )
                      ],
                    )),
                SizedBox(height:16,),


                Text.rich(
                    TextSpan(
                        children:[
                          TextSpan(
                              text: 'Password',
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
                SizedBox(
                  height:4,
                ),
                Form(
                    key: _formKey3,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please enter some password';
                            }
                            return null;

                          },
                          obscureText:state.isEyeShow ?? false,
                          decoration:InputDecoration(
                            hintText: 'Password',
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                              suffixIcon:IconButton(
                                onPressed:(){
                                  context.read<SplashCubit>().isShowPassword((state.isEyeShow??false));
                                },
                                icon: Icon((state.isEyeShow ?? false)
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )
                          ),
                        )
                      ],
                    )),


                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: Checkbox(value:state.chekBox??false,
                          activeColor: Colors.blue,
                          tristate: true,
                          onChanged:(d){
                            context.read<SplashCubit>().isShowChekbox(state.chekBox??false);
                            d=state.chekBox;
                          }),
                    ),
                    Text('Remember me',style: TextStyle(color: Color(0xFF4E4B66),),),
                    SizedBox(
                      width:50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: (){
                    if (_formKey.currentState!.validate() && _formKey1.currentState!.validate() && _formKey2.currentState!.validate()
                        && _formKey3.currentState!.validate()) {
                      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                  },
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(6)
                  ),
                  child: Container(
                    width: 380,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child:Center(
                      child: Text(
                        'Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child:Text('or continue with',style: TextStyle(color: Color(0xFF4E4B66),fontSize: 14,),),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Expanded(child:MaterialButton(onPressed:(){},
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        width: 160,
                        height: 48,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(6),
                          color: Color(0xFFEEF1F4),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child:Row(
                            children: [
                              Image.asset('assets/1pageviewpage/img_1.png',width: 24,
                                height: 24,),
                              SizedBox(
                                width:10,
                              ),
                              Text('Facebook',style: TextStyle(color: Color(0xFF667080),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,),)
                            ],),),

                      ),),),
                    
                  SizedBox(
                    width:30,
                  ),
                    Expanded(child: MaterialButton(onPressed:(){},
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child:Container(
                        width: 160,
                        height: 48,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(6),
                          color: Color(0xFFEEF1F4),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child:Row(
                            children: [
                              Image.asset('assets/1pageviewpage/img_2.png',width: 24,
                                height: 24,),
                              SizedBox(
                                width:10,
                              ),
                              Text('Google',style: TextStyle(color: Color(0xFF667080),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,),)
                            ],),),

                      ),))

                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ? ',style: TextStyle(color: Color(0xFF667080)),),
                    TextButton(onPressed:(){
                      Navigator.pushReplacementNamed(context,'/loginPage');
                    }, child:Text('Login',style: TextStyle(color: Color(0xFF1877F2),fontWeight: FontWeight.w600,),))
                  ],
                ),

              ],
            )
          ],
        ),
      );
    }
  }
}