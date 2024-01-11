import 'package:news_wave/repository/news_repository.dart';

import '../model/news_chanel_headlines_model.dart';

class NewsViewModel{

  final NewsRepository _repo = NewsRepository();

  Future<NewsChannelHeadLineModel>fetchNewChannelHeadLineApi(String channelName)async{
    final response = await _repo.fetchNewChannelHeadLineApi(channelName);
    return response;
  }

}