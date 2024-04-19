import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soft_groupe/data/blocs/all_bloc/all_bloc.dart';
import 'package:soft_groupe/data/blocs/apple_bloc/apple_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/model/model_news.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';
import 'package:soft_groupe/ui/pages/0_splash_page/splash_page.dart';
import 'package:soft_groupe/ui/pages/10_trending_page/trending_page.dart';
import 'package:soft_groupe/ui/pages/11_notification_page/notification_page.dart';
import 'package:soft_groupe/ui/pages/12_searche_page/searche_page.dart';
import 'package:soft_groupe/ui/pages/13_author_profile_page/author_profile_page.dart';
import 'package:soft_groupe/ui/pages/14_explore_page/explore_page.dart';
import 'package:soft_groupe/ui/pages/15_book_mark_page/book_mark_page.dart';
import 'package:soft_groupe/ui/pages/16_detail_screen_news_page/detail_screen_page.dart';
import 'package:soft_groupe/ui/pages/19_detail_screen_settings_page/detail_screen_settings_page.dart';
import 'package:soft_groupe/ui/pages/1_onbording/page_view.dart';
import 'package:soft_groupe/ui/pages/2_login_page/login_page.dart';
import 'package:soft_groupe/ui/pages/3_register_page/register_page.dart';
import 'package:soft_groupe/ui/pages/4_verification_page/verification_page.dart';
import 'package:soft_groupe/ui/pages/5_select_country_page/select_country_page.dart';
import 'package:soft_groupe/ui/pages/6_topics_page/topics_page.dart';
import 'package:soft_groupe/ui/pages/7_news_source_page/news_source_page.dart';
import 'package:soft_groupe/ui/pages/8_fill_profil_page/fill_profil_page.dart';

import 'package:soft_groupe/ui/pages/9_home_page/home_page.dart';
import 'package:soft_groupe/ui/pages/9_home_page/home_page2.dart';
import 'package:soft_groupe/ui/pages/forgot_password_page/forgot_page.dart';

import 'package:dio/dio.dart';

import 'data/blocs/news_bloc/news_bloc.dart';
import 'data/blocs/techno_bloc/techno_bloc.dart';
import 'data/blocs/tesla_bloc/tesla_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('profil');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //commint
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[

      BlocProvider(create:(context)=>SplashCubit(),
      ),
      BlocProvider(create: (context)=>AllBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>AppleBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>NewsBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>TechnoBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>TeslaBloc(NetWorkService(Dio()))),


    ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
           // initialRoute: '/HomePage',

          onGenerateRoute: (settings) {

            switch (settings.name) {
              case "/":
                return CupertinoPageRoute(
                  builder: (context) => SplashPage(),  // 0
                );
              case "/pageView":
                return CupertinoPageRoute(
                  builder: (context) => Onbording(),  //1
                );
              case "/loginPage":
                return CupertinoPageRoute(
                  builder: (context) => LoginPage(),   //2
                );
              case "/registerPage":
                return CupertinoPageRoute(
                  builder: (context) => RegisterPage(),  //3
                );
              case "/forgotPage":
                return CupertinoPageRoute(
                  builder: (context) => ForgotPage(),  // 3a
                );
              case "/vertificationPage":
                return CupertinoPageRoute(
                  builder: (context) => VertificationPage(),  //4
                );
              case "/SelectCountryPage":
                return CupertinoPageRoute(
                  builder: (context) => SelectCountryPage(), //5
                );
              case "/topicsPage":
                return CupertinoPageRoute(
                  builder: (context) => TopicsPage(),   //6
                );case "/":
              return CupertinoPageRoute(
                builder: (context) => SplashPage(),  // 0
              );
              case "/pageView":
                return CupertinoPageRoute(
                  builder: (context) => Onbording(),  //1
                );
              case "/loginPage":
                return CupertinoPageRoute(
                  builder: (context) => LoginPage(),   //2
                );
              case "/registerPage":
                return CupertinoPageRoute(
                  builder: (context) => RegisterPage(),  //3
                );
              case "/forgotPage":
                return CupertinoPageRoute(
                  builder: (context) => ForgotPage(),  // 3a
                );
              case "/vertificationPage":
                return CupertinoPageRoute(
                  builder: (context) => VertificationPage(),  //4
                );
              case "/SelectCountryPage":
                return CupertinoPageRoute(
                  builder: (context) => SelectCountryPage(), //5
                );
              case "/topicsPage":
                return CupertinoPageRoute(
                  builder: (context) => TopicsPage(),   //6
                );
              case "/newsPage":
                return CupertinoPageRoute(
                  builder: (context) => NewsPage(),  //7
                );
              case "/filProfilPage":
                return CupertinoPageRoute(
                  builder: (context) => FillProfilPage(), //8
               );
                case "/HomePage":
                return CupertinoPageRoute(
                  builder: (context) => HomePage(),  //9
                );
              case "/HomePage2":
                return CupertinoPageRoute(
                  builder: (context) => HomePage2(),  //9a
                );
              case "/DatailScreenNewsPage":
                return CupertinoPageRoute(
                  builder: (context) => DatailScreenNewsPage(articles: settings.arguments as Articles,), //16
                );
              case "/ExplorePage":
                return CupertinoPageRoute(
                  builder: (context) => ExplorePage(),   //14
                );
              case "/BookMarkPage":
                return CupertinoPageRoute(
                  builder: (context) => BookMarkPage(),   //15
                );
              case "/ProfilePage":
                return CupertinoPageRoute(
                  builder: (context) => ProfilePage(),  //13
                );
              case "/NotificationPage":
                return CupertinoPageRoute(
                  builder: (context) => NotificationPage(),  //13
                );
              case "/TrendingPage":
                return CupertinoPageRoute(
                  builder: (context) => TrendingPage(),  //13
                );
              case "/SearchePage":
                return CupertinoPageRoute(
                  builder: (context) => SearchePage(),  //13
                );
              case "/SettingsPage":
                return CupertinoPageRoute(
                  builder: (context) => SettingsPage(),  //13
                );
                
            }
          },
        ));
  }
}


