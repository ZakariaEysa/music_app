import 'package:dio/dio.dart';

class QuranWebServes {
  late Dio dio;
  final BaseURl = "https://server11.mp3quran.net/yasser/101.mp3";

  QuranWebServes() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> GetAllSongs() async {
    try {
      Response response = await dio.get(BaseURl);

      return response.data[0];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
