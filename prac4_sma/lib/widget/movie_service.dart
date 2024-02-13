import 'package:prac4_sma/api_singleton/dio_singleton.dart';
import '../model/peli.dart';

class MovieService {
  final DioSingleton _dio = DioSingleton();

  Future<List<Peli>> getNowPlayingMovies() async {
    try {
      final response = await _dio.get(
          'movie/now_playing');
      final data = response.data['results'] as List;
      return data.map((json) => Peli.fromJson(json)).toList();
    } catch (e, stackTrace) {
      print('$stackTrace');
      throw Exception('Failed to load now playing movies: $e');
    }
  }

  Future<List<Peli>> getUpcomingMovies() async {
    try {
      final response = await _dio.get(
          'movie/upcoming');
      final data = response.data['results'] as List;
      return data.map((json) => Peli.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load upcoming movies: $e');
    }
  }
}
