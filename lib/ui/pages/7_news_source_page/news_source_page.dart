

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
              appBar: AppBar(

                centerTitle:true,
                title:Text('Choose your News Sources',style: TextStyle(fontSize: 16,
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


            Expanded(child: ListView(
              children: [
                Column(
                  children: [
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_7.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNBC',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_8.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'VICE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_9.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Vox',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_10.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'BBC News',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_11.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'SCMP',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_12.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_13.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'MSN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_14.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_15.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'USA Today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_16.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'TIME',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_17.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Buzzfeed',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_18.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Daily Mail',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_7.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNBC',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_8.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'VICE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_9.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Vox',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_10.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'BBC News',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_11.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'SCMP',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_12.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_13.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'MSN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_14.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'CNET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_15.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'USA Today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),
                    Padding(padding:EdgeInsets.only(top:16),
                      child:  Row(
                        children: [
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_16.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'TIME',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),



                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_17.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Buzzfeed',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                          Expanded(child:Column(children: [
                            Container(
                              width: 96,
                              height: 84,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFFEEF1F4),
                              ),
                              child: Center(child:Image.asset('assets/1pageviewpage/img_18.png',width: 70,
                                height: 70,),),
                            ),
                            Text(
                              'Daily Mail',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:8,
                            ),
                            InkWell(
                              borderRadius:BorderRadius.circular(6),
                              onTap: (){},
                              child:Container(
                                width: 97,
                                height: 32,
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:Border.all(width: 1, color: Color(0xFF1877F2))
                                ),
                                child:Center(child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                              ),
                            )


                          ],)),
                        ],
                      ),),



                  ],
                )
              ],
            )),

            SizedBox(
              height:20,
            ),
            MaterialButton(
              padding:EdgeInsets.zero,
              shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(6)
              ),
              onPressed:(){
                Navigator.pushNamed(context, '/filProfilPage');
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
            SizedBox(
              height:20,
            )
          ],
        ),
      ) ;
    }
  }
}
