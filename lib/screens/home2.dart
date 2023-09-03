import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Homee(),
//     );
//   }
// }

class Movie {
  final String title;
  final String overview;
  final String posterpath;

  Movie({required this.title, required this.overview, required this.posterpath});
}

class Homee extends StatefulWidget {
  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final Uri url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=922eb5229d27d2d04a9575f29caeb210');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      setState(() {
        movies = results
            .map((movieData) => Movie(
                  title: movieData['title'],
                  overview: movieData['overview'],
                  posterpath: movieData['poster_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}'
                    : '',
                ))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Filmes Popularess'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie.title),
            subtitle: Text(movie.overview),
            leading: Image.network(movie.posterpath)
          );
        },
      ),
    );
  }
}
