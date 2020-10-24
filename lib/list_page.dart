import 'package:flutter/material.dart';

// リスト画面
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 初期リスト
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                  'https://img4.yna.co.kr/etc/inner/KR/2019/06/25/AKR20190625020900005_01_i_P4.jpg',
                height: 120),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'test1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text("12"),
                        ],
                    ),
                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            Text('点数：139'),
                            SizedBox(width: 10),
                            Text('予約順位：1'),
                            SizedBox(width: 10),
                            Text('予約率：35.5')
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('公開日：2020年10月24日')
                      ],
                    ),
              )
            ],
          ),
        ),
      ]
    );
  }

// 1-3. 리스트 화면 (고정 더미 데이터)

// 1-3. 리스트 화면 (동적 데이터 호출1)

// 1-3. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)
}