import "package:flutter/material.dart";

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
    // 3-3. 댓글 입력 화면 (_buildMovieTitle)
    return Text("영화 제목");
  }

  Widget _buildUserRating() {
    // 3-4. 댓글 입력 화면 (_buildUserRating)
    return Text("유저가 별점을 설정할 수 있는 화면");
  }

  Widget _buildHorizontalDivider() {
    // 3-5. 댓글 입력 화면 (_buildHorizontalDivider)
    return Text("회색 구분선 화면");
  }

  Widget _buildNickNameInputForm() {
    // 3-6. 댓글 입력 화면 (_buildNickNameInputForm)
    return Text("닉네임 입력");
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
