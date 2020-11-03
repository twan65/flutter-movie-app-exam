import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:padak_starter/model/widget/star_rating_bar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'comment_page.dart';
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

  _DetailState(String movieId) {
    this.movieId = movieId;
  }

  // 初期処理
  @override
  void initState() {
    super.initState();
    _requestMovie();
  }

  @override
  Widget build(BuildContext context) {
    // 仮映画情報取得
    // _movieResponse = DummysRepository.loadDummyMovie(movieId);

    // 仮コメントデータ取得
    // _commentsResponse = DummysRepository.loadComments(movieId);

    return Scaffold(
        appBar: AppBar(
          title: Text(_movieTitle),
        ),
        body: _buildContents());
  }

  // 詳細画面の構成
  Widget _buildContents() {

    Widget contentsWidget;

    if (_movieResponse == null) {
      contentsWidget = Center(
        child: CircularProgressIndicator(),
      );
    } else {
      contentsWidget = SingleChildScrollView(
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

    return contentsWidget;
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

  // 予約率
  Widget _buildReservationRate() {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '予約率',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
                '${_movieResponse.reservationGrade} 上 ${_movieResponse.reservationRate.toString()}%'),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 50,
      color: Colors.grey,
    );
  }

  // 評点の表示
  Widget _buildUserRating() {
    return Column(
      children: <Widget>[
        Text(
          '評点',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text("${_movieResponse.userRating / 2}"),
      ],
    );
  }

  // 累計観客数の表示
  Widget _buildAudience() {
    return Column(
      children: <Widget>[
        Text(
          '累計観客数',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(NumberFormat().format(_movieResponse.audience)),
      ],
    );
  }

  // 映画流れの略：Synopsis表示
  Widget _buildMovieSynopsis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            'Synopsis',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Text(_movieResponse.synopsis),
        )
      ],
    );
  }

  // 監督・出演の表示
  Widget _buildMovieCast() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '監督・出演',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '監督',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(_movieResponse.director),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Text(
                    '出演',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(_movieResponse.actor),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  // コメント表示
  Widget _buildComment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 10,
          color: Colors.grey.shade400,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '一行評',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.create),
                  color: Colors.blue,
                  onPressed: () => _presentCommentPage(context),
              )
            ],
          ),
        ),
        _buildCommentListView()
      ],
    );
  }

  Widget _buildCommentListView() {

    Widget contentsWidget;

    if (_commentsResponse == null) {
      contentsWidget = Center(child: CircularProgressIndicator());
    } else {
      contentsWidget = ListView.builder(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(10.0),
        itemCount: _commentsResponse.comments.length,
        itemBuilder: (_, index) =>
          _buildItem(comment: _commentsResponse.comments[index]),
      );
    }

    return contentsWidget;
  }

  // コメント入力画面に遷移
  void _presentCommentPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(
      _movieResponse.title,
      _movieResponse.id,
    ),));
  }

  Widget _buildItem({@required Comment comment}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.person_pin,
            size: 50,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(comment.writer),
                  SizedBox(width: 5),
                  StarRatingBar(
                    rating: comment.rating.toInt(),
                    isUserInteractionEnabled: false,
                    size: 20,
                  )
                ],
              ),
              Text(_convertTimeStampToDateTime(comment.timestamp)),
              SizedBox(height: 5),
              Text(comment.contents)
            ],
          )
        ],
      ),
    );
  }

  void _requestMovie() async {
    // 映画リストの初期化
    setState(() {
      _movieResponse = null;
      _commentsResponse = null;
    });

    final movieResponse = await _getMovieResponse();
    final commentsResponse = await _getCommentsResponse();

    setState(() {
      _movieResponse = movieResponse;
      _movieTitle = movieResponse.title;
      _commentsResponse = commentsResponse;
    });

  }

  // 詳細データ取得
  Future<MovieResponse> _getMovieResponse() async {
    // データ取得
    final response = await http.get(
        'http://padakpadak.run.goorm.io/movie?id=${widget.movieId}'
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final movieResponse = MovieResponse.fromJson(jsonData);
      return movieResponse;
    }

    return null;
  }

  // コメント取得
  Future<CommentsResponse> _getCommentsResponse() async {
    // データ取得
    final response = await http.get(
        'http://padakpadak.run.goorm.io/comments?movie_id=${widget.movieId}'
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final commentsResponse = CommentsResponse.fromJson(jsonData);
      return commentsResponse;
    }

    return null;
  }


  // 日付フォーマットに変換
  String _convertTimeStampToDateTime(int timestamp) {
    final dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return dateFormatter.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

}
