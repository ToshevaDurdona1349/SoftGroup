import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/model_news.dart';

class DatailScreenNewsPage extends StatelessWidget {
  DatailScreenNewsPage({required this.articles}) ;
  Articles articles;
  @override
  Widget build(BuildContext context) {

    print('kelgan model:${articles?.title}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: <Widget>[
          MaterialButton(onPressed: (){},
          child: SvgPicture.asset('assets/16_detail_screen_news_page/shaere.svg'),
          ),

          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
                itemBuilder: (context){
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
                onSelected:(value){
                  if(value == 0){
                    print("My account menu is selected.");
                  }else if(value == 1){
                    print("Settings menu is selected.");
                  }else if(value == 2){
                    print("Logout menu is selected.");
                  }
                }
            ),


        ],
      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
        child: SafeArea(
          child:SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Expanded(child: Text('${articles.source?.name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                MaterialButton(onPressed: ()async{
                  await launchUrl(Uri.parse('${articles.url}'));
                },
                  child: Container(
                    width: MediaQuery.of(context).size.width/4,
                    height:MediaQuery.of(context).size.width/12,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue
                    ),
                    child: Center(child: Text("Following",style: TextStyle(color: Colors.white),)),
                  ),
                )
              ],),
              Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width*2/3,
              decoration: BoxDecoration(
                 image: DecorationImage(///--------------------------------------------rasmga shakl berish
                   image: NetworkImage("${articles.urlToImage}"),
                 fit: BoxFit.fill
                 ),
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(12)
            ),
        ),
              Text("   ${articles.title}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
              Text("   ${articles.description}",style: TextStyle(color: Colors.black,fontSize: 16)),
              Text("\n   ${articles.content}",style: TextStyle(color: Colors.black,fontSize: 16)),
            ],),
          )

        ),
      )
    );
  }
}
