import 'package:assignment/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    if (movieProvider.movies.isEmpty && !movieProvider.isloading) {
      movieProvider.searchMovies('avengers');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (searchQuery) {
                movieProvider.searchMovies(searchQuery);
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: movieProvider.isloading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : movieProvider.movies.isEmpty
                ? const Center(
              child: Text('No movies found'),
            )
                : ListView.builder(
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: CustomContainer(
                      poster: movie.poster,
                      title: movie.title ?? "Unknown Title",
                      year: movie.year ?? "Unknown Year",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
