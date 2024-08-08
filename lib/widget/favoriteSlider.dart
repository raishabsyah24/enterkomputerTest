import 'package:enterkomputertest/constants.dart';
import 'package:enterkomputertest/pages/detailsPage.dart';
import 'package:flutter/material.dart';

class FavoriteSlider extends StatelessWidget {
  const FavoriteSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(mmovie: snapshot.data[index]),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
