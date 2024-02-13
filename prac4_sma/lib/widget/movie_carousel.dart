import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:animate_do/animate_do.dart';
import '../model/peli.dart';
import '../screens/movie_detail_screen.dart';

class MovieCarousel extends StatelessWidget {
  final List<Peli> movies;

  const MovieCarousel({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
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
          child: SlideInUp(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w780${movies[index].backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      viewportFraction: 0.8,
      scale: 0.8,
      autoplay: true,
      pagination: SwiperPagination(),
    );
  }
}
