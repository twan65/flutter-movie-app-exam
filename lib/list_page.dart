import 'package:flutter/material.dart';

// リスト画面
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 初期リスト
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: Colors.grey),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildDummyItem();
      },
    );
  }

  // ListItem共通化
  Widget _buildDummyItem() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
              "assets/ic_19.png",
              height: 120
          ),
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
                    _buildGradeImage(12),
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
    );
  }

  // 1-3. 리스트 화면 (동적 데이터 호출1)

  // グレードイメージ取得
  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return Image.asset("assets/ic_allages.png");
      case 12:
        return Image.asset("assets/ic_12.png");
      case 15:
        return Image.asset("assets/ic_15.png");
      case 19:
        return Image.asset("assets/ic_19.png");
      default:
        return null;
    }
  }
}
