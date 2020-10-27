import 'package:flutter/material.dart';
import 'package:padak_starter/detail_page.dart';
import 'model/data/dummys_repository.dart';
import 'model/response/movies_response.dart';

// リスト画面
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 映画リスト
    final List<Movie> movies = DummysRepository.loadDummyMovies();

    // リストビュー
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: Colors.grey),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        // return _buildItem(movies[index]);
        return InkWell(
          child: _buildItem(movies[index]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => DetailPage(movies[index].id)
              ),
            );
          },
        );
      },
    );
  }

  // リストアイテム
  Widget _buildItem(Movie movie) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            movie.thumb,
            height: 120
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildGradeImage(movie.grade),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('評点：${movie.userRating / 2}'),
                    SizedBox(width: 10),
                    Text('予約順位：${movie.reservationGrade}'),
                    SizedBox(width: 10),
                    Text('予約率：${movie.reservationRate}')
                  ],
                ),
                SizedBox(height: 10),
                Text('公開日：${movie.date}')
              ],
            ),
          )
        ],
      ),
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
