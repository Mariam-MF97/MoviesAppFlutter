import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/screens/movie_details/movie_details_view.dart';

class MovieWidget extends StatelessWidget {
  MovieWidget({this.movie});

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsView(id: movie.id)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(8),
        height: 250,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.purple[100],
          ],
        )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width / 3,
              child: Hero(
                tag: 'dash',
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                  fit: BoxFit.fitHeight,
                ),
              )),
          SizedBox(
            width: 18,
          ),
          Expanded(
              // flex: 2,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                movie.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              Wrap(
                  children: movie.genreIds
                      .map((e) => Chip(
                            backgroundColor: Colors.purple[50],
                            label: Text(
                              '${e}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ))
                      .toList()),
              Text(
                'Language: ${movie.originalLanguage}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    '${movie.voteAverage}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
