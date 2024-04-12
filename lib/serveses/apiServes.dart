import 'package:dio/dio.dart';

class newServes {
  final Dio dio;
  newServes(this.dio);

  // Response response = await dio.get(
  // 'https://newsapi.org/v2/top-headlines?country=us&apiKey=1dd3c7acaad548689a813352fced51f0&category=$Ccategory');

  //
  // Future<List<ArticleModel>> getNews({required String Ccategory}) async {
  //   try {
  //     Response response = await dio.get(
  //         'https://newsapi.org/v2/top-headlines?country=us&apiKey=1dd3c7acaad548689a813352fced51f0&category=$Ccategory');
  //
  //     Map<String, dynamic> JsonData = await response.data;
  //     List<dynamic> articles = await JsonData['articles'];
  //     //print(articles);
  //     List<ArticleModel> ArticlesList = await [];
  //
  //     for (var el in articles) {
  //       ArticlesList.add(await ArticleModel.fromjson(el));
  //     }
  //     return ArticlesList;
  //   } catch (e) {
  //     return [];
  //     // TODO
  //   }
  // }

//
}
