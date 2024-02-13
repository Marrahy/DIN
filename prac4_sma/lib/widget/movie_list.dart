import 'package:flutter/material.dart';
import '../model/peli.dart';
import '../screens/movie_detail_screen.dart';

class MovieList extends StatelessWidget {
  final List<Peli> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movies[index]),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w300${movies[index].posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
