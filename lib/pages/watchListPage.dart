import 'package:enterkomputertest/api/api.dart';
import 'package:enterkomputertest/models/movie.dart';
import 'package:enterkomputertest/widget/watchListSlider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  late Future<List<Movie>> watchListMovie;

  @override
  void initState() {
    super.initState();
    watchListMovie = Api().getWatchListMovies();
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
                'WatchList Movie',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: watchListMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return WatchListSlider(snapshot: snapshot);
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
