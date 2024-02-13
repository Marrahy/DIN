import 'package:flutter/material.dart';
import '../model/peli.dart';

class MovieDetailScreen extends StatefulWidget {
  final Peli movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool _showOriginalTitle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showOriginalTitle ? Text(widget.movie.originalTitle) : Text(widget.movie.title),
        actions: [
          Switch(
            value: _showOriginalTitle,
            onChanged: (value) {
              setState(() {
                _showOriginalTitle = value;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Image.network(
                'https://image.tmdb.org/t/p/w780${widget.movie.posterPath}',
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            Text(
              'Fecha de estreno: ${_formatReleaseDate(widget.movie.releaseDate)}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Valoración:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(
              value: widget.movie.voteAverage / 10,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getColorForRating(widget.movie.voteAverage),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sinopsis:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.movie.overview,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  String _formatReleaseDate(String releaseDate) {
    DateTime dateTime = DateTime.parse(releaseDate);
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }

  Color _getColorForRating(double rating) {
    if (rating >= 7.5) {
      return Colors.green;
    } else if (rating >= 5.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
