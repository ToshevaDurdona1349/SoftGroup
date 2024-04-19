import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/all_bloc/all_bloc.dart';
import '../../../data/blocs/news_bloc/news_bloc.dart';
import '../../../data/cubits/splash_cubit/splash_cubit.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Explore", style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Topic",
                        style: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),)),
                      TextButton(onPressed: () {}, child: Text("See all",
                        style: TextStyle(
                            fontSize: 14, color: Colors.black54),)),
                    ],),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlocBuilder<AllBloc, AllState>(
                      builder: (context, state) {
                        return buildBody(state);
                      },),
                  ),
                  Text("  Popular Topic", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                      return buildBody1(state);},),
                  ),
                ],
              ),
            ),),
          ),


          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              BlocProvider.of<SplashCubit>(context).onChangeOnly(
                  value1: index); // o'zgaruvchiga qiymat berilmoqda
              if (index == 0) {
                Navigator.pushNamed(context, "/HomePage");
              }
              if (index == 2) {
                Navigator.pushNamed(context, "/BookMarkPage");
              }
              if (index == 3) {
                Navigator.pushNamed(context, "/ProfilePage");
              }
            },
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            currentIndex: state.value1!,
            // o'zgaruvchidan qiymat olinmoqda

            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.portrait_rounded), label: "Profile"),
            ],
          ),
        );
      },
    );
  }

  Widget buildBody(AllState state) {
    if (state is AllSuccsesState) {
      state.modelNews.articles?.removeWhere((element) =>
      element.urlToImage == null);
      return ListView.builder(
          itemCount: state.modelNews.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  print('index :${index}');
                  print('runTimeType :${state.modelNews.articles?[index]
                      .runtimeType}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',
                      arguments: state.modelNews.articles?[index]);
                },
                child: Container(
                    height: 140,
                    child: Row(children: [
                      Container(
                        height: 120,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage("${state.modelNews
                                  .articles?[index].urlToImage}"),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.modelNews.articles?[index].title}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.modelNews.articles?[index].source
                                        ?.name}', style: TextStyle(fontSize: 14,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,),
                                  Text('${state.modelNews.articles?[index]
                                      .publishedAt}',
                                    overflow: TextOverflow.ellipsis,)
                                ],)
                            ],),
                        ),
                      ),
                      MaterialButton(onPressed: () {

                      },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 6,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width / 12,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue
                          ),
                          child: Center(child: Text("Saved", style: TextStyle(
                              color: Colors.white),)),
                        ),
                      )
                    ])));
          });
    }
    else if (state is AllInitialState) {
      return Center(child: CircularProgressIndicator(),);
    }
    else if (state is AllFailureState) {
      return Center(child: Text("Failure"),);
    }
    else
      return Center(child: Text('No Data'),);
  }
  Widget buildBody1(NewsState state){


    if (state is NewsLoadedState) {
      state.data.articles?.removeWhere((element) =>
      element.urlToImage == null);
      return ListView.builder(
        itemCount:state.data.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // height: 140,
            child: Column( //--------------------------------------------------tortinchi --bu rasm va yozuvlar
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width/3*2,
                  decoration: BoxDecoration(
                      image: DecorationImage(///--------------------------------------------rasmga shakl berish
                          image: NetworkImage("${state.data.articles?[index].urlToImage}"),
                          fit: BoxFit.fill
                      ),
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  // child: Image.network()
                ),
                Text('USA',style: TextStyle(color: Colors.black45,fontSize:16)),
                Text('${state.data.articles?[index].title}',style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold)),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${state.data.articles?[index].source?.name}',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.bold)),
                    Text('  ${state.data.articles?[index].publishedAt}'),
                  ],
                ),
              ],
            ),
          );

        },);
    }
    else if (state is NewsInitialState) {
      return Center(child: CircularProgressIndicator(),);
    }
    else if (state is NewsFailureState) {
      return Center(child: Text("Failure"),);
    }
    else
      return Center(child: Text('No Data'),);


  }

}
