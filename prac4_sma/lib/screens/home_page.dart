import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../model/peli.dart';
import 'package:animate_do/animate_do.dart';

import '../widget/movie_service.dart';
import 'movie_detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Peli> nowPlayingList = [];
  List<Peli> upcomingList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final movieService = MovieService();

      final nowPlayingMovies = await movieService.getNowPlayingMovies();
      final upcomingMovies = await movieService.getUpcomingMovies();

      setState(() {
        nowPlayingList = nowPlayingMovies;
        upcomingList = upcomingMovies;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star),
                      Text('Movie App'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {}, // No callback
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Swiper(
                    itemCount: nowPlayingList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                movie: nowPlayingList[index],
                              ),
                            ),
                          );
                        },
                        child: SlideInUp(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w780${nowPlayingList[index].backdropPath}',
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    viewportFraction: 0.8,
                    scale: 0.8,
                    autoplay: true,
                    pagination: const SwiperPagination(),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: upcomingList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                movie: upcomingList[index],
                              ),
                            ),
                          );
                        },
                        child: SlideInUp(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w300${upcomingList[index].posterPath}',
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
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
