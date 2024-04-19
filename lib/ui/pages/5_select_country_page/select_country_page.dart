
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';


class SelectCountryPage extends StatelessWidget {
   SelectCountryPage({super.key});


  List<String> list=['Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
    'Angola',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Iceland',
     'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland'
  ];

  List<String> list2=[
    'assets/1pageviewpage/img_6.png',
    'assets/1pageviewpage/img_20.png',
    'assets/1pageviewpage/img_22.png',
    'assets/1pageviewpage/img_23.png',
    'assets/1pageviewpage/img_24.png',
    'assets/1pageviewpage/img_25.png',
    'assets/1pageviewpage/img_26.png',
    'assets/1pageviewpage/img_27.png',
    'assets/1pageviewpage/img_28.png',
    'assets/1pageviewpage/img_29.png',
    'assets/1pageviewpage/img_30.png',
    'assets/1pageviewpage/img_31.png',
    'assets/1pageviewpage/img_32.png',
    'assets/1pageviewpage/img_33.png',
    'assets/1pageviewpage/img_34.png',
    'assets/1pageviewpage/img_35.png',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(

              appBar: AppBar(

                centerTitle:true,
              title:Text('Select your Country',style: TextStyle(fontSize: 16,
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
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child:TextField(
                readOnly:true,
                decoration:InputDecoration(
                    suffixIcon:Icon(Icons.search),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  hintText: "Search",
                ),
              ),
            ),

            Expanded(child: ListView.builder(itemBuilder:(context,index){
              return Padding(padding:EdgeInsets.only(left:24,top:16,right:24),
                child:MaterialButton(onPressed:(){},
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    child:Container(
                       width: MediaQuery.of(context).size.width,
                      height: 48,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child:Row(children: [
                        Image.asset('${list2[index]}',width: 32,
                          height: 32,),
                        SizedBox(
                          width:16,
                        ),
                        Text(
                          '${list[index]}',
                          style: TextStyle(
                            color: Color(0xFF4E4B66),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],),
                    ),),
              );

            },
              itemCount:list.length,
            )
            ),
            SizedBox(
              height:20,
            ),
            MaterialButton(
              padding:EdgeInsets.zero,
              shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(6)
              ),
              onPressed:(){
                Navigator.pushReplacementNamed(context, '/topicsPage');
              },
              child: Container(
                 width: MediaQuery.of(context).size.width,
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
