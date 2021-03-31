import 'package:flutter/material.dart';
import 'package:movies_app/screens/movie/movie_view_provider.dart';
import 'package:movies_app/screens/movie_widget.dart';
import 'package:provider/provider.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieViewProvider>(
      create: (context) => MovieViewProvider(),
      child: Consumer<MovieViewProvider>(
        builder: (buildContext, movieViewProvider, _) {
          return (movieViewProvider.movies != null)
              ? ListView.builder(
                  itemCount: movieViewProvider.movies.length,
                  itemBuilder: (ctx, index) {
                    final movie = movieViewProvider.movies[index];
                    return MovieWidget(movie: movie);
                  })
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
