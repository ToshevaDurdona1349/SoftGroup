import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/all_bloc/all_bloc.dart';
import 'package:soft_groupe/data/blocs/apple_bloc/apple_bloc.dart';
import 'package:soft_groupe/data/blocs/news_bloc/news_bloc.dart';
import 'package:soft_groupe/data/blocs/techno_bloc/techno_bloc.dart';
import 'package:soft_groupe/data/blocs/tesla_bloc/tesla_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

import '../../../data/model/model_news.dart';

class TrendingPage extends StatelessWidget {
   TrendingPage({Key? key}) : super(key: key);
 final  Map<int, ModelNews> map={};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBloc, AllState>(
      builder: (contextAll, stateAll) {
        return BlocBuilder<AppleBloc, AppleState>(
          builder: (contextAp, stateAp) {
            return BlocBuilder<TeslaBloc, TeslaState>(
              builder: (contextTes, stateTes) {
                return BlocBuilder<TechnoBloc, TechnoState>(
                  builder: (contextTech, stateTech) {
                    return BlocBuilder<NewsBloc, NewsState>(
                      builder: (contextNew, stateNew) {

                        if(stateAll is AllInitialState &&
                            stateAp is AppleInitialState &&
                            stateNew is NewsInitialState &&
                            stateTech is TechnoInitialState &&
                            stateTes is TeslaInitialState)
                          return Scaffold(body: Center(child:CircularProgressIndicator(),),);

                        else if (
                        stateAll is AllSuccsesState &&
                        stateNew is NewsLoadedState &&
                        stateAp is AppleSuccsesState &&
                        stateTech is TechnoSuccesState &&
                        stateTes is TeslaSuccestate
                        ) {
                          map[0]=stateAll.modelNews;
                          map[1]=stateNew.data;
                          map[2]=stateAp.modelNews;
                          map[3]=stateTech.data;
                          map[4]=stateTes.data;
                          return BlocBuilder<SplashCubit, SplashState>(
                            builder: (context, state) {
                              return Scaffold(
                            appBar: AppBar(
                               leading: IconButton(
                               icon: Icon(Icons.arrow_back),
                               onPressed: () {
                                   Navigator.pop(context);
                               },
                               ),
                               title: Center(child: Text('Trending')),

                               actions: [
                                       PopupMenuButton(
                                    itemBuilder: (context) {
                                        return [
                                           PopupMenuItem<int>(
                                             value: 0,
                                               child: Text("My Account"),
                                           ),

                                           PopupMenuItem<int>(
                                              value: 1,
                                             child: Text("Settings"),
                                           ),

                                            PopupMenuItem<int>(
                                                value: 2,
                                                 child: Text("Logout"),
                                            ),
                                                ];
                                            },
                                                 onSelected: (value) {
                                                        if (value == 0) {
                                                          print("My account menu is selected.");
                                                 } else if (value == 1) {
                                                           print("Settings menu is selected.");
                                                 } else if (value == 2) {
                                                             print("Logout menu is selected.");
                                                            }
                                                    }),

                                    ],
                                    ),
                          body: Container(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                                   child: ListView.builder(
                                     scrollDirection: Axis.vertical,
                                    itemCount: 15,
                                     itemBuilder:(context, index) {
                                         return buildItem(context,index,map);
                                      },),
                                       ),
                                bottomNavigationBar: BottomNavigationBar(
                                  onTap: (int index){
                                    BlocProvider.of<SplashCubit>(context).onChangeOnly(value1: index);// o'zgaruvchiga qiymat berilmoqda
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
                                  currentIndex: state.value1!,  // o'zgaruvchidan qiymat olinmoqda

                                  items: const[
                                    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                                    BottomNavigationBarItem(icon: Icon(Icons.explore),label: "Explore"),
                                    BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Bookmark"),
                                    BottomNavigationBarItem(icon: Icon(Icons.portrait_rounded),label: "Profile"),
                                  ],
                                ),
                          );
  },
);
                          }
                        else return Scaffold(body: Center(child: Text("Error"),),);
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget buildItem(BuildContext context, int index,Map<int, ModelNews> map) {
    List<Articles>list=[];
    map.forEach((key, value) {
      for(int i=0; i<3;i++){
        list.add(value.articles![i]);
      }
    });
    return InkWell(onTap: () {
      Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: list[index] );
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.5,


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(///--------------------------------------------rasmga shakl berish
                    image: NetworkImage("${list[index].urlToImage}"),
                    fit: BoxFit.fill
                ),
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.circular(12)
            ),
            // child: Image.network()
          ),
          Text('   USA',style: TextStyle(color: Colors.black45,fontSize:16)),
          Text('${list[index].title}',style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
          // Text('${list[index].description}',style: TextStyle(color: Colors.black,fontSize:18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${list[index].source?.name}',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.bold)),
              Text(' ${list[index].publishedAt}',overflow:TextOverflow.ellipsis,),
            ],
          ),

        ],),
    ),);

 }
}
