import "package:flutter/material.dart";

// 1-2. タブ画面 (各画面のimport)

// 1-2. タブ画面 (Stateless -> Stateful)
// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  // 1-2. タブ画面 (_selectedTabIndex変数を移動)

  // 1-2. タブ画面 (createState関数追加)
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
