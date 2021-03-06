import "package:flutter/material.dart";
import 'dart:convert';

import 'package:padak_starter/model/response/movie_response.dart';
import 'package:http/http.dart' as http;
import 'package:padak_starter/model/response/movies_response.dart';

import 'grid_page.dart';
import 'list_page.dart';

// 1-2. タブ画面 (Stateless -> Stateful)
// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

// State作成
class _MainPageState extends State<MainPage> {

  int _selectedTabIndex = 0;
  int _selectedSortIndex = 0;
  MoviesResponse _moviesResponse;

  // 初期処理
  @override
  void initState() {
    super.initState();
    _requestMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TOP画面のタイトル
        title: Text('Twan Movie'),
        // ポップアップボタン及びイベント追加
        actions: <Widget>[
          _buildPopupMenuButton()
        ],
      ),

      // List, Grid Widget連動
      body: _buildPage(_selectedTabIndex, _moviesResponse),

      // bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Grid'),
          ),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex Tab Clicked");
          });
        },
      ),
    );
  }

  void _requestMovies() async {
    // 映画リストの初期化
    setState(() {
      _moviesResponse = null;
    });

    // データ取得
    final response = await http.get(
      'http://padakpadak.run.goorm.io/movies?order_type=$_selectedSortIndex'
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final moviesResponse = MoviesResponse.fromJson(jsonData);
      setState(() {
        _moviesResponse = moviesResponse;
      });
    }
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<int>(
        icon: Icon(Icons.sort),
        onSelected: _onSortMethodTap,
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: 0, child: Text("予約数順")),
            PopupMenuItem(value: 1, child: Text("キュレーション")),
            PopupMenuItem(value: 2, child: Text("最新順")),
          ];
        }
    );
  }

  void _onSortMethodTap(index) {
    setState(() {
      _selectedSortIndex = index;

      if(index == 0) print("予約数順");
      else if(index == 1) print("キュレーション");
      else print("最新順");
    });

    _requestMovies();
  }

}

// List, Grid Widget変換
Widget _buildPage(index, MoviesResponse moviesResponse) {
  Widget contentsWidget;

  if (moviesResponse == null) {
    contentsWidget = Center(child: CircularProgressIndicator());
  } else {
    switch(index) {
      case 0:
        contentsWidget = ListPage(moviesResponse.movies);
        break;
      case 1:
        contentsWidget = GridPage(moviesResponse.movies);
        break;
      default:
        contentsWidget = Container();
    }
  }

  return contentsWidget;
}