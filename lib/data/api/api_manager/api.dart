
import 'dart:convert';

import 'package:movie_app/core/constant_manager.dart';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

class Api {

  static const _popularUrl ='https://api.themoviedb.org/3/movie/popular?api_key=${ConstantManager.apiKey}';
  static const _newReleasesUrl ='https://api.themoviedb.org/3/movie/upcoming?api_key=${ConstantManager.apiKey}';
  static const _recommendedUrl ='https://api.themoviedb.org/3/movie/top_rated?api_key=${ConstantManager.apiKey}';

  Future<List<Movie>> getPopularMovies() async{
    final response = await http.get(Uri.parse(_popularUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something went wrong');
    }

  }

  Future<List<Movie>> getNewReleasesMovies() async{
    final response = await http.get(Uri.parse(_newReleasesUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something went wrong');
    }

  }

  Future<List<Movie>> recommendedMovies() async{
    final response = await http.get(Uri.parse(_recommendedUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something went wrong');
    }

  }


  Future<List<Movie>> similarMovies(int movieId) async {
    final _similarUrl = 'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${ConstantManager.apiKey}';

    final response = await http.get(Uri.parse(_similarUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(response.body);

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> searchMovies(String query) async{
    final _searchUrl ='https://api.themoviedb.org/3/search/movie?api_key=${ConstantManager.apiKey}&query=$query';

    final response = await http.get(Uri.parse(_searchUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something went wrong');
    }

  }
  Future<List<Movie>> getMoviesByCategory(String categoryId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=${ConstantManager.apiKey}&with_genres=$categoryId'),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}'); // طباعة البيانات

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print('Movies data: $data'); // طباعة النتائج المسترجعة
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}