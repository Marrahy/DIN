import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  factory DioSingleton() => _instance;
  DioSingleton._internal();
  final _client = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhODI1YmJmNTYzODZkYjUxZWI5ZjBjNTRlNmM0MjVjZSIsInN1YiI6IjY1Y2I2OWE0MWMwOWZiMDE2MzM4MWE1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.k2oOTgrRsyhmlhgYrivGiLhyZA-2LK1F5YwlwYk8ug4'
    },
  ));

  Future<Response<T>> get<T>(String url) async {
    try {
      return await _client.get(url);
    } catch(e) {
      rethrow;
    }
  }
}
