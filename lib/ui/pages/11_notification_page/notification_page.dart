import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/apple_bloc/apple_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/model/model_news.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppleBloc, AppleState>(
      builder: (context, state) {
        if(state is AppleInitialState){
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        else if(state is AppleSuccsesState){
          state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);

          return BlocBuilder<SplashCubit, SplashState>(
  builder: (context1, state1) {
    return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Center(child: Text('Notification')),
              automaticallyImplyLeading: false,
              actions: [

                PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text("Profile"),
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
                        Navigator.pushNamed(context, "/ProfilePage");
                      } else if (value == 1) {
                        Navigator.pushNamed(context, "/SettingsPage");
                      } else if (value == 2) {
                        Navigator.pushNamed(context, "/loginPage");
                      }
                    }
                ),

              ],
            ),
            body: Container(
                child: ListView.builder(
                  itemCount: state.modelNews.articles?.length,
                  itemBuilder: (context, index) {
                  return itemBuild(context,index,state.modelNews);
                },
                )
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
);
        }
        else if(state is AppleFailureState)
          return Scaffold(body: Center(child: Text("Error"),),);
        else return Scaffold(body: Center(child: Text("Error"),),);
      },
    );
  }

  Widget itemBuild(BuildContext context,int index,ModelNews modelNews) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        color: Color(0xFFEEF1F4),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.fill,
            image: NetworkImage("${modelNews.articles?[index].urlToImage}"))
          ),
        ),
        Expanded(
          child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("${modelNews.articles?[index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
            //Text("${modelNews.articles?[index].description}",style: TextStyle(),),
            Text("${modelNews.articles?[index].publishedAt}",style: TextStyle(),),

          ],),),
        ),
        Center(child: InkWell(
          onTap: () async{
            await launchUrl(Uri.parse('${modelNews.articles?[index].url}'));
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("+ Follow"),
          ),
        ),)
      ],),
    );
  }
}
