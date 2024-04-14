import 'package:dio/dio.dart';

class newServes {
  final Dio dio;

  newServes(this.dio);

  Future<void> ApiRockets() async {
    Response response = await dio.get('https://api.spacexdata.com/v4/rockets');

    List<dynamic> JsonData = await response.data;
    // print(JsonData);
    // print(JsonData[0]["height"]["meters"]);
  }
}
