import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/movie_details_request.dart';
import 'package:movies_app/model/movie_details.dart';

class MovieDetailsProvider extends ChangeNotifier {
  var _movieDetailsRequest = MovieDetailsRequest();
  MovieDetails movie;
  final id;

  MovieDetailsProvider({this.id}) {
    getMovie();
  }

  void getMovie() {
    _movieDetailsRequest.fetchMovie(this.id).then((value) {
      movie = value;
      notifyListeners();
    });
  }
}
