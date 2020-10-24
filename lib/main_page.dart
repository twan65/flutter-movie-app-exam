import "package:flutter/material.dart";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TOP画面のタイトル
        title: Text('Twan Movie'),
        // ポップアップボタン及びイベント追加
        actions: <Widget>[
          PopupMenuButton<int>(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                if(value == 0) print("予約数順");
                else if(value == 1) print("キュレーション");
                else print("最新順");
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 0, child: Text("予約数順")),
                  PopupMenuItem(value: 1, child: Text("キュレーション")),
                  PopupMenuItem(value: 2, child: Text("最新順")),
                ];
              }
          ),
        ],
      ),

      // List, Grid Widget連動
      body: _buildPage(_selectedTabIndex),

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
}

// List, Grid Widget変換
Widget _buildPage(index) {
  if(index == 0) return ListPage();
  else return GridPage();
}