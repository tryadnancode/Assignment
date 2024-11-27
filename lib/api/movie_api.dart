import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/movie_model.dart';

Future<List<Movie>> fetchMovies(String query) async {
  final apiKey = '329813fe'; // Your API Key
  final url = Uri.parse('https://www.omdbapi.com/?apikey=$apiKey&s=$query');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['Search'] != null) {
      return (data['Search'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load movies');
  }
}
