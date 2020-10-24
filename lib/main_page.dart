import "package:flutter/material.dart";

// 1-2. タブ画面 (各画面のimport)

// 1-2. タブ画面 (Stateless -> Stateful)
class MainPage extends StatelessWidget {
  // 1-2. タブ画面 (_selectedTabIndex変数を移動)
  // タブインデックス設定
  int _selectedTabIndex = 0;

  // 1-2. タブ画面 (createState関数追加)

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

      // 1-2. List, Grid Widget連動
      body: Center(child: Text("Hello Flutter")),
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
          _selectedTabIndex = index;
          print("$_selectedTabIndex Tab Clicked");
        },
      ),
    );
  }
}

// State作成

// List, Grid Widget変換
