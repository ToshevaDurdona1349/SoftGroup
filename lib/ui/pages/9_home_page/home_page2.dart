import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/news_bloc/news_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../data/blocs/all_bloc/all_bloc.dart';
import '../../../data/blocs/apple_bloc/apple_bloc.dart';
import '../../../data/blocs/techno_bloc/techno_bloc.dart';
import '../../../data/blocs/tesla_bloc/tesla_bloc.dart';
import '../../../data/cubits/splash_cubit/splash_cubit.dart';
import '../../../data/model/model_news.dart';
import '../16_detail_screen_news_page/detail_screen_page.dart';

class HomePage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 5, child:
    BlocBuilder<SplashCubit, SplashState>(
  builder: (context1, state1) {
    return Scaffold(
        body: Padding(padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
          child: SafeArea(child: SingleChildScrollView(
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
             SizedBox(height: 5),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Latest',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
                TextButton(onPressed: (){}, child: Text('Sea all',style: TextStyle(color: Colors.black45))),
              ],),
            Container(
              width: 340,
              height: 30,
              child: TabBar(
                isScrollable: true,
                indicatorWeight: 1,
                onTap: (index){

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
              width: 360,
              height: 500,
              // width: MediaQuery.of(context).size.width,
              child: TabBarView(
                children: [
                  
                  BlocBuilder<AllBloc, AllState>(builder: (context, state) {
                    return buildBody0(state);},),

                  BlocBuilder<AppleBloc, AppleState>(builder: (context, state) {
                    return buildBody1(state);},),

                  BlocBuilder<TeslaBloc, TeslaState>(builder: (context, state) {
                    return buildBody2(state);},),

                  BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                    return buildBody3(state);},),

                  BlocBuilder<TechnoBloc, TechnoState>(builder: (context, state) {
                    return buildBody4(state);},),
                ],
              ),
            ),
          ]
        )
       ))
    ),

      bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                BlocProvider.of<SplashCubit>(context1).onChangeOnly(value1: index);
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
              currentIndex: state1.value1!,

              unselectedItemColor:Colors.black,
              selectedItemColor:Colors.blue,
              showUnselectedLabels:true,
              unselectedLabelStyle:TextStyle(color: Colors.black),
              items: const[
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.explore),label: "Explore"),
                BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Bookmark"),
                BottomNavigationBarItem(icon: Icon(Icons.portrait_rounded),label: "Profile"),
              ],
            ),
        );
  },
)
    );
    }
  Widget buildBody0(AllState state){

    if(state is AllSuccsesState){
      state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.modelNews.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  print('runTimeType :${state.modelNews.articles?[index].runtimeType}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.modelNews.articles?[index]);
                },
                child:Container(
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
                ));


          });
    }
    else if(state is AllInitialState){
     return Center(child: CircularProgressIndicator(),);
    }
    else if(state is AllFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

    }
  Widget buildBody1(AppleState state){

    if(state is AppleSuccsesState){
      state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.modelNews.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.modelNews.articles?[index]);
                },
                child:Container(
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
                ));


          });
    }
    else if(state is AppleInitialState){
     return Center(child: CircularProgressIndicator(),);
    }
    else if(state is AppleFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

    }
  Widget buildBody2(TeslaState state){

    if(state is TeslaSuccestate){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.data.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.data.articles?[index]);
                  },
                child:Container(
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
                ));


          });
    }
    else if(state is TeslaInitialState){
     return Center(child: CircularProgressIndicator(),);
    }
    else if(state is TeslaFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

    }
  Widget buildBody3(NewsState state){

    if(state is NewsLoadedState){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.data.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.data.articles?[index]);
                  },
                child:Container(
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
                ));


          });
    }
    else if(state is NewsInitialState){
     return Center(child: CircularProgressIndicator(),);
    }
    else if(state is NewsFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

    }
  Widget buildBody4(TechnoState state){

    if(state is TechnoSuccesState){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.data.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.data.articles?[index]);
                  },
                child:Container(
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
                ));


          });
    }
    else if(state is TeslaInitialState){
     return Center(child: CircularProgressIndicator(),);
    }
    else if(state is TeslaFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

    }

  }



