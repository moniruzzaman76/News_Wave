import 'package:news_wave/repository/news_repository.dart';

import '../model/news_chanel_headlines_model.dart';

class NewsViewModel{

  final NewsRepository _repo = NewsRepository();

  Future<NewsChannelHeadLineModel>fetchNewChannelHeadLineApi()async{
    final response = await _repo.fetchNewChannelHeadLineApi();
    return response;
  }

}