import 'package:flutter/foundation.dart';

import '../api/movie_api.dart';
import '../model/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  bool isloading = false;
  List<Movie> get movies => _movies;

  Future<void> searchMovies(String query) async {
    isloading = true;
    _movies = await fetchMovies(query);
    notifyListeners();
    try {
      _movies = await fetchMovies(query); // Fetch movies from API
    } catch (error) {
      _movies = []; // Handle error by setting empty movies list
      debugPrint('Error fetching movies: $error');
    } finally {
      isloading = false; // Stop loading
      notifyListeners();
    }
  }
}
