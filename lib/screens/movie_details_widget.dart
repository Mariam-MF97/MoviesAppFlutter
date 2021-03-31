import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  MovieDetailsWidget({this.movie});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.purple,
            Colors.purple[100],
          ],
        )),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height / 2.5,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              movie.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: movie.genres
                  .map((e) => Chip(
                          label: Text(
                        e.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )))
                  .toList(),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              movie.overview,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
          ],
        ));
  }
}
