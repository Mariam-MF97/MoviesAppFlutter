import 'package:movies_app/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movies_app/model/movie_details.dart';

class MovieDetailsRequest {
  MovieDetailsRequest();

  Future fetchMovie(id) async {
    http.Response response = await http.get(
        'https://api.themoviedb.org/3/movie/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      MovieDetails movies = MovieDetails.fromJson(data);
      return movies;
    } else {
      throw "Something went wrong!";
    }
  }
}
