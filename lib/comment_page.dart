import "package:flutter/material.dart";
import 'package:padak_starter/model/widget/star_rating_bar.dart';

class CommentPage extends StatefulWidget {
  final String movieTitle;
  final String movieId;

  CommentPage(this.movieTitle, this.movieId);

  @override
  CommentPageState createState() => CommentPageState(movieTitle, movieId);
}

class CommentPageState extends State<CommentPage> {
  String movieTitle;
  String movieId;

  final scaffoldState = GlobalKey<ScaffoldState>();
  int _rating = 0;
  String _writer = "";
  String _contents = "";

  CommentPageState(String movieTitle, String movieId) {
    this.movieTitle = movieTitle;
    this.movieId = movieId;
  }

  // コメント入力画面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('一行評'),
        actions: <Widget>[
          _buildSubmitButton(),
        ],
      ),
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMovieTitle(),
                _buildUserRating(),
                _buildHorizontalDivider(),
                _buildNickNameInputForm(),
                _buildCommentInputForm(),
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    final sendIcon = Icon(
      Icons.send,
      color: Colors.white,
      size: 25,
    );

    return IconButton(
        icon: sendIcon,
        onPressed: () {
          if (_writer.isEmpty || _contents.isEmpty) {
            _showSnackBar('全ての情報を入力してください。');
          } else {
            Navigator.of(context).pop(true);
          }
        });
  }

  Widget _buildMovieTitle() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        widget.movieTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildUserRating() {
    return Column(
      children: [
        StarRatingBar(
          onRatingChanged: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        ),
        Text((_rating / 2.0).toString())
      ],
    );
  }

  Widget _buildHorizontalDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 4),
      width: double.infinity,
      height: 10,
      color: Colors.grey.shade400,
    );
  }

  // ニックネーム入力
  Widget _buildNickNameInputForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: (text) => _writer = text,
        maxLines: 1,
        maxLength: 20,
        decoration: InputDecoration(
          hintText: 'ニックネームを入力してください',
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          )
        ),
      ),
    );
  }

  Widget _buildCommentInputForm() {
    // 3-7. 댓글 입력 화면 (_buildCommentInputForm)
    return Text("한줄평 입력");
  }

  void _showSnackBar(String text) {
    final snackBar = SnackBar(content: Text(text));
    scaffoldState.currentState.showSnackBar(snackBar);
  }
}
