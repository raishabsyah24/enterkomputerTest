// import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterkomputertest/api/api.dart';
import 'package:enterkomputertest/models/movie.dart';
import 'package:enterkomputertest/pages/favoritePage.dart';
import 'package:enterkomputertest/pages/profilePage.dart';
import 'package:enterkomputertest/pages/watchListPage.dart';
import 'package:enterkomputertest/widget/popularSlider.dart';
import 'package:enterkomputertest/widget/nowPlayingSlider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> nowPlayingMovies;

  @override
  void initState() {
    super.initState();

    nowPlayingMovies = Api().getNowPlayinMovies();
    popularMovies = Api().getNowPlayinMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
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
                'Now Playing',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return NowPlayingSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Popular Movies',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return PopularSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.blue.shade700,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                SizedBox(height: 12),
                Text(
                  'Rais Habsyah',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  'habsyahrais24@gmail.com',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.watch_later),
              title: const Text('Whistlist'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WatchListPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritePage()));
              },
            ),
          ],
        ),
      );
}
