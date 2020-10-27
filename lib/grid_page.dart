import 'package:flutter/material.dart';

import 'model/data/dummys_repository.dart';
import 'model/response/movies_response.dart';

class GridPage extends StatelessWidget {
  final List<Movie> movies = DummysRepository.loadDummyMovies();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (9 / 16),
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) =>
            _buildGrideItem(context, index: index),
    );
  }

  Widget _buildGrideItem(BuildContext context, {@required int index}) {
    Movie movie = movies[index];

    return Container(

    );
  }

  // グレードイメージ取得
  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return Image.asset("assets/ic_allages.png");
      case 12:
        return Image.asset("assets/ic_12.png");
      case 15:
        return Image.asset("assets/ic_15.png");
      case 19:
        return Image.asset("assets/ic_19.png");
      default:
        return null;
    }
  }
}
