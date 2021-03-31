import 'package:flutter/material.dart';
import 'package:movies_app/screens/movie_details/movie_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/screens/movie_details_widget.dart';

class MovieDetailsView extends StatelessWidget {
  MovieDetailsView({this.id});

  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: ChangeNotifierProvider<MovieDetailsProvider>(
        create: (context) => MovieDetailsProvider(id: this.id),
        child: Consumer<MovieDetailsProvider>(
          builder: (ctx, movieDetailsProvider, _) {
            print(movieDetailsProvider.movie);
            return (movieDetailsProvider.movie != null)
                ? MovieDetailsWidget(
                    movie: movieDetailsProvider.movie,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
