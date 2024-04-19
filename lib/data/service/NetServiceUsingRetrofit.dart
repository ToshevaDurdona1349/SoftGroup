import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/model_news.dart';
//https://newsapi.org/v2/everything?q=apple&from=2024-01-02&to=2024-01-02&sortBy=popularity&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/everything?q=tesla&from=2023-12-03&sortBy=publishedAt&apiKey=57d556b41e0a40169cbecea58e562d76
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=57d556b41e0a40169cbecea58e562d76
//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=57d556b41e0a40169cbecea58e562d76

//d4bb802cd5434447a51f0477f58e5e22     -Dilnoza
//57d556b41e0a40169cbecea58e562d76      -jurabek
//5a88a82c5d0b43d9ac73e8b2f6f6172d     -Shaxzod


part 'NetServiceUsingRetrofit.g.dart';
@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class NetWorkService{
  factory NetWorkService(Dio dio,{String baseUrl})=_NetWorkService;


  @GET('/everything?{q}')
  Future<ModelNews?> news(
      @Path('q') String q,
      @Query('apiKey') String apiKey
      );


  @GET('/everything?q=apple&{from}&{to}&sortBy=popularity&apiKey=5a88a82c5d0b43d9ac73e8b2f6f6172d')
  Future<ModelNews> appleNews(
      @Query('from') String from,
      @Query('to') String to,
      );
//

  @GET('/everything?q=tesla&{from}&sortBy=publishedAt&apiKey=5a88a82c5d0b43d9ac73e8b2f6f6172d')
  Future<ModelNews> teslaNews(
      @Query('from') String from,
      );

  @GET('/top-headlines?{country}&category=business&apiKey=5a88a82c5d0b43d9ac73e8b2f6f6172d')
  Future<ModelNews> countryNews(
      @Query('country') String country,
      );

  @GET('/top-headlines?sources=techcrunch&apiKey=5a88a82c5d0b43d9ac73e8b2f6f6172d')
  Future<ModelNews> techcrunchNews();

  @GET('/everything?domains=wsj.com&apiKey=5a88a82c5d0b43d9ac73e8b2f6f6172d')
  Future<ModelNews> allNews();
}