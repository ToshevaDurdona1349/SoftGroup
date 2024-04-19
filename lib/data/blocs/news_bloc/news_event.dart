part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
class CountryEvent extends NewsEvent{
 final String country;
 CountryEvent(this.country);
}
