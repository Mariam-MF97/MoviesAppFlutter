import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/movie_request.dart';
import 'package:movies_app/model/movie.dart';

class MovieViewProvider extends ChangeNotifier {
  var _movieRequest = MovieRequest();
  List<Result> movies;

  MovieViewProvider() {
    getMovies();
  }

  void getMovies() {
    _movieRequest.fetchData().then((list) {
      movies = list;
      notifyListeners();
    });
  }
}
