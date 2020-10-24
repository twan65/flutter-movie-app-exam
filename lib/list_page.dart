import 'package:flutter/material.dart';

// リスト画面
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 初期リスト
    return ListView(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画１")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画２")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画３")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画４")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画５")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画６")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画７")),
        Padding(padding: EdgeInsets.all(8.0), child: Text("映画８")),
      ],
    );
  }

// 1-3. 리스트 화면 (고정 더미 데이터)

// 1-3. 리스트 화면 (동적 데이터 호출1)

// 1-3. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)
}