
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/news_bloc/news_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/blocs/all_bloc/all_bloc.dart';
import '../../../data/blocs/apple_bloc/apple_bloc.dart';
import '../../../data/blocs/techno_bloc/techno_bloc.dart';
import '../../../data/blocs/tesla_bloc/tesla_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  //TextEditingController textEditingController=TextEditingController();




  @override
  Widget build(BuildContext context) {


    DateTime dateTime=DateTime.now().toUtc();

    String dayTime='${dateTime.year}-${dateTime.month<9?'0':''}${dateTime.month}-${(dateTime.day-2)<9?'0':''}${dateTime.day-1}';
    String dayTimeforTesla='${dateTime.year}-${dateTime.month-1<9?'0':''}${dateTime.month-1}-${(dateTime.day-1)<9?'0':''}${dateTime.day-1}';

    BlocProvider.of<AllBloc>(context).add(AllLoadedEvent());
    BlocProvider.of<AppleBloc>(context).add(AppleLoadedEvent(dayTime,dayTime));
    BlocProvider.of<TechnoBloc>(context).add(TechLoadedEvent());
    BlocProvider.of<TeslaBloc>(context).add(TeslaLoadedEvent(dayTimeforTesla));
    
    BlocProvider.of<NewsBloc>(context).add(CountryEvent('us'));
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {

       if(state is NewsLoadedState){
         // quyida rasmi yoq newsni trendda chiqarmaslik chorasi qilingan
         state.data.articles?.removeWhere((element) => element.urlToImage==null);


         return DefaultTabController(length: 5,
             child:BlocBuilder<SplashCubit, SplashState>(
  builder: (context1, state1) {
    print("scaffold state1 : ${state1}");
    print("scaffold state1.valu1 : ${state1.value1}");
    return Scaffold(
           body: Padding(
             padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
             child: SafeArea(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Row( //------------------------------------------------------eng tepa birinchi qator
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SvgPicture.asset('assets/9_home_page/bosh.svg'),
                         InkWell(onTap: (){
                             Navigator.pushNamed(context, "/NotificationPage");
                           },
                          child:SvgPicture.asset('assets/9_home_page/qongiroq.svg'),
                         )

                       ],
                     ),//-------------------------------------------------------eng tepa birinchi qator
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Form(
                           // key: _formKey3,
                           child: Column(
                             children: [
                               TextFormField(
                                 validator: (value){

                                 },
                                 decoration:InputDecoration(
                                     border:OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                   prefixIcon: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: IconButton(onPressed: () {
                                       Navigator.pushNamed(context, "/SearchePage");
                                     },
                                     icon: SvgPicture.asset('assets/9_home_page/searche.svg'))

                                   ),
                                   suffixIcon: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: IconButton(onPressed: () {
                                       Navigator.pushNamed(context, "/SettingsPage");
                                     },
                                     icon: SvgPicture.asset('assets/9_home_page/balance.svg'))

                                   ),
                                   hintText: "Searche",

                                 ),

                               )
                             ],
                           )),
                     ),
                     Row(//-----------------------------------------------------Uchinchi static yozuv va bitta Text button
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Trending',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1),),
                         /// ---------------------------------------------------------------------------problem bosganda boshqa page ga otish kk
                         TextButton(onPressed: (){
                           Navigator.pushNamed(context, "/TrendingPage");
                         }, child:Text('See all',style: TextStyle(fontSize: 18,color: Colors.black45)))


                       ],),//-----------------------------------------------------Uchinchi static yozuv

                     Column( //--------------------------------------------------tortinchi --bu rasm va yozuvlar
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.width/3*2,
                           decoration: BoxDecoration(
                               image: DecorationImage(///--------------------------------------------rasmga shakl berish
                                   image: NetworkImage("${state.data.articles?[0].urlToImage}"),
                                   fit: BoxFit.fill
                               ),
                               color: Colors.cyanAccent,
                               borderRadius: BorderRadius.circular(12)
                           ),
                           // child: Image.network()
                         ),
                         Text('USA',style: TextStyle(color: Colors.black45,fontSize:16)),
                         Text('${state.data.articles?[0].title}',style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold)),
                         Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text('${state.data.articles?[0].source?.name}',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.bold)),
                             Text('  ${state.data.articles?[0].publishedAt}'),
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             TextButton(onPressed: (){

                               showDialog(context: context, builder: (context)=>AlertDialog(
                                 title: Text("Latest News"),
                                 content: Text("Enter here how many days ago do you need?"),
                                 actions: [
                                   TextField(
                                    // controller:textEditingController,
                                     decoration: InputDecoration(
                                       border: OutlineInputBorder(),
                                       hintText: ' 1'
                                     ),
                                   ),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child:Text("Reject")),
                                    TextButton(onPressed: ()async{
                                      // await BlocProvider.of<SplashCubit>(context1).changeMinusDay(enteringday: textEditingController);  //   kunni o'zgartirish uchun
                                      // BlocProvider.of<AppleBloc>(context).add(AppleLoadedEvent(
                                      //     '${dateTime.year}-${dateTime.month<9?'0':''}${dateTime.month}-${(dateTime.day-1)<9?'0':''}${dateTime.day-1}',
                                      //     '${dateTime.year}-${dateTime.month<9?'0':''}${dateTime.month}-${(dateTime.day-1)<9?'0':''}${dateTime.day-1}'));
                                     // Navigator.pop(context);
                                    }, child:Text("Apply"))
                                   ],)
                                 ],
                               ));
                             }, child: Text('Latest',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
                             TextButton(onPressed: (){
                               Navigator.pushNamed(context, '/HomePage2');
                             }, child: Text('Sea all',style: TextStyle(color: Colors.black45))),
                           ],),
                       ],
                     ),//---------------------------------------------------------tortinchi --bu rasm va yozuvlar
                     Container(
                       width: 340,
                       height: 30,
                       child: TabBar(
                         isScrollable: true,
                         //indicatorWeight: 10,
                         indicatorWeight: 1,
                         onTap: (index){
                           print("index funksiya ichi${index}");
                         },
                         tabAlignment:  TabAlignment.start,
                         tabs: [
                           Tab(text: 'All News'),
                           Tab(text: 'Apple News'),
                           Tab(text: 'Tesla News'),
                           Tab(text: 'Country News'),
                           Tab(text: 'Techno News'),
                         ],
                       ),
                     ),
                     Container(
                       width:MediaQuery.of(context).size.width,
                      height: 400,
                      // width: MediaQuery.of(context).size.width,
                       child: TabBarView(
                         children: [
                           BlocBuilder<AllBloc, AllState>(builder: (context, state0) {
                             return buildBody0(state0);},),

                           BlocBuilder<AppleBloc, AppleState>(builder: (context, state1) {
                             return buildBody1(state1);},),

                           BlocBuilder<TeslaBloc, TeslaState>(builder: (context, state2) {
                             return buildBody2(state2);},),

                           buildBody3(state),
                           BlocBuilder<TechnoBloc, TechnoState>(builder: (context, state3) {
                             return buildBody4(state3);},),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),

           bottomNavigationBar: BottomNavigationBar(
                 onTap: (int index){
                   BlocProvider.of<SplashCubit>(context1).onChangeOnly(value1: index);// o'zgaruvchiga qiymat berilmoqda
                   if (index == 1) {
                     Navigator.pushNamed(context,"/ExplorePage");
                   }
                   if (index == 2) {
                     Navigator.pushNamed(context, "/BookMarkPage");
                   }
                   if (index == 3) {
                     Navigator.pushNamed(context, "/ProfilePage");
                   }
                },
                unselectedItemColor:Colors.black,
                 showUnselectedLabels:true,
                selectedItemColor:Colors.blue,
                 currentIndex: state1.value1!,  // o'zgaruvchidan qiymat olinmoqda

                items: const[
               BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.explore),label: "Explore"),
               BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Bookmark"),
               BottomNavigationBarItem(icon: Icon(Icons.portrait_rounded),label: "Profile"),
                ],
               ),
         );
  },
) );

       }
       //
       else{
         return Scaffold(
           body: SafeArea(child: Center(child: CircularProgressIndicator()),),
         );
       }

      },
    );
  }
  Widget buildBody0(AllState state){

    if(state is AllSuccsesState){
      state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);

      return ListView.builder(
        itemCount:state.modelNews.articles?.length??0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 140,
              child: Row(children: [
                Container(
                  height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${state.modelNews.articles?[index].urlToImage}"),
                        fit: BoxFit.fill,
                      )
                    ),
                    ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('${state.modelNews.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('${state.modelNews.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        Text('${state.modelNews.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                      ],)
                    ],),
                  ),
                )
              ],)
          );

        });
    }
    else if(state is AllInitialState){
      return Container(
        child: SafeArea(child: Center(child: CircularProgressIndicator()),),
      );
    }
    else return Center(child: Text('error'),);
  }
  Widget buildBody1(AppleState state){

    if(state is AppleSuccsesState){
      state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);

      return ListView.builder(
        itemCount:state.modelNews.articles?.length??0,
        itemBuilder: (BuildContext context, int index) {
          return   Container(
              height: 140,
              child: Row(children: [
                Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${state.modelNews.articles?[index].urlToImage}"),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${state.modelNews.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.modelNews.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                            Text('${state.modelNews.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                          ],)
                      ],),
                  ),
                )
              ],)
          );

        },);
    }
    else if(state is AppleInitialState){
      return Container(
        child: SafeArea(child: Center(child: CircularProgressIndicator()),),
      );
    }
    else return Center(child: Text('error'),);
  }
  Widget buildBody2(TeslaState state){

    if(state is TeslaSuccestate){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);

      return ListView.builder(
        itemCount:state.data.articles?.length??0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 140,
              child: Row(children: [
                Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${state.data.articles?[index].urlToImage}"),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${state.data.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.data.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                            Text('${state.data.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                          ],)
                      ],),
                  ),
                )
              ],)
          );

        },);
    }
    else if(state is TeslaInitialState){
      return Container(
        child: SafeArea(child: Center(child: CircularProgressIndicator()),),
      );
    }
    else return Center(child: Text('error'),);
  }
  Widget buildBody3(NewsLoadedState state){
          return ListView.builder(
        itemCount:state.data.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 140,
              child: Row(children: [
                Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${state.data.articles?[index].urlToImage}"),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${state.data.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.data.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                            Text('${state.data.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                          ],)
                      ],),
                  ),
                )
              ],)
          );

        },);
    }
  Widget buildBody4(TechnoState state){

    if(state is TechnoSuccesState){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);

      return ListView.builder(
        itemCount:state.data.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 140,
              child: Row(children: [
                Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${state.data.articles?[index].urlToImage}"),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${state.data.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.data.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                            Text('${state.data.articles?[index].publishedAt}',style: TextStyle(fontSize: 12),overflow:TextOverflow.ellipsis,)
                          ],)
                      ],),
                  ),
                )
              ],)
          );

        },);
    }
    else if(state is TechnoInitialState){
      return Container(
        child: SafeArea(child: Center(child: CircularProgressIndicator()),),
      );
    }
    else return Center(child: Text('error'),);
  }
}
