import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news_wave/model/news_chanel_headlines_model.dart';
class NewsRepository{

  Future<NewsChannelHeadLineModel>fetchNewChannelHeadLineApi()async{
    String url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=81ba334151a14b288f9525a6d40a2b4a";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadLineModel.fromJson(body);
    }
    throw Exception("Error");
  }

}