import "package:flutter/material.dart";

import 'model/data/dummys_repository.dart';
import 'model/response/comments_response.dart';
import 'model/response/movie_response.dart';

class DetailPage extends StatefulWidget {
  final String movieId;

  DetailPage(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return _DetailState(movieId);
  }
}

class _DetailState extends State<DetailPage> {
  String movieId;
  String _movieTitle = '';
  MovieResponse _movieResponse;
  CommentsResponse _commentsResponse;

  _DetailState(String movieId){
    this.movieId = movieId;
  }

  @override
  Widget build(BuildContext context) {
    // テストデータの設定
    _movieResponse = DummysRepository.loadDummyMovie(movieId);

    // 2-5. 상세 화면 (테스트 데이터 설정 - 댓글 상세)

    return Scaffold(
        appBar: AppBar(
          // 2-1. 상세 화면 (제목 설정)
          title: Text(_movieResponse.title),
        ),
        body: _buildContents()
    );
  }

  // 詳細画面の構成
  Widget _buildContents() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          _buildMovieSummary(),
          _buildMovieSynopsis(),
          _buildMovieCast(),
          _buildComment(),
        ],
      ),
    );
  }

  // Summary
  Widget _buildMovieSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(_movieResponse.image, height: 180),
            SizedBox(width: 10),
            _buildMovieSummaryTextColumn(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildReservationRate(),
            _buildVerticalDivider(),
            _buildUserRating(),
            _buildVerticalDivider(),
            _buildAudience(),
          ],
        ),
      ],
    );
  }

  // テキスト情報
  Widget _buildMovieSummaryTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _movieResponse.title,
          style: TextStyle(fontSize: 22),
        ),
        Text(
          '${_movieResponse.date} 公開',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '${_movieResponse.genre} / ${_movieResponse.duration}分',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // テキスト情報
  Widget _buildReservationRate() {
    return null;
  }

  // 予約率
  Widget _buildVerticalDivider() {
    return null;
  }

  // 評点
  Widget _buildUserRating() {
    return null;
  }

  // 累計観客数
  Widget _buildAudience() {
    return null;
  }

  // 2-2. Summary 화면 (2-2 과정 - 예매율)

  // 2-2. Summary 화면 (2-2 과정 - 평점)

  // 2-2. Summary 화면 (2-2 과정 - 누적관객수)

  // 2-2. Summary 화면 (2-2 과정 - 구분선)

  Widget _buildMovieSynopsis() {
    // 2-3. Synopsis 화면 (화면 구현)
    return Text("映画内容略");
  }
  Widget _buildMovieCast() {
    // 2-4. MovieCast 화면 (감독 / 출연 구현)
    return Text("監督・出演");
  }
  Widget _buildComment() {
    // 2-5. Comment 화면 (화면 구현)
    return Text("コメント");
  }

  // 2-5. Comment 화면 (한줄평 리스트)

  // 2-5. Comment 화면 (한줄평 아이템 화면 구축)

  // 2-5. Comment 화면 (포맷에 맞춰 날짜 데이터 반환)

  // 2-5. Comment 화면 (댓글 입력 창으로 이동)
}