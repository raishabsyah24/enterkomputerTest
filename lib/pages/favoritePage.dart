import 'package:enterkomputertest/api/api.dart';
import 'package:enterkomputertest/models/movie.dart';
import 'package:enterkomputertest/widget/favoriteSlider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Future<List<Movie>> favoriteMovie;

  @override
  void initState() {
    super.initState();
    favoriteMovie = Api().getFavoriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'images/enterkomputer.png',
          fit: BoxFit.cover,
          height: 230,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite Movie',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: favoriteMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return FavoriteSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
