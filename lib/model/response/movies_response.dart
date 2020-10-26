class MoviesResponse {
  int orderType;
  List<Movie> movies;

  // コンストラクタ
  MoviesResponse({
    this.orderType,
    this.movies,
  });

  // map構造から新しいMoviesResponseオブジェクトを生成
  MoviesResponse.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((movie) {
        movies.add(Movie.fromJson(movie));
      });
    }

    orderType = json['order_type'];
  }

  // MoviesResponseからmapに変換
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (movies != null) {
      map['movies'] = movies.map((movie) => movie.toMap()).toList();
    }

    map['order_type'] = orderType;
    return map;
  }
}

class Movie {
  String id;
  String title;
  int userRating;
  int grade;
  int reservationGrade;
  String date;
  String thumb;
  double reservationRate;

  Movie(
    this.title,
    this.userRating,
    this.grade,
    this.reservationGrade,
    this.id,
    this.date,
    this.thumb,
    this.reservationRate,
  );

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userRating = json['user_rating'];
    grade = json['grade'];
    reservationGrade = json['reservation_grade'];
    id = json['id'];
    date = json['date'];
    thumb = json['thumb'];
    reservationRate = json['reservation_rate'];
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['title'] = title;
    map['user_rating'] = userRating;
    map['grade'] = grade;
    map['reservation_grade'] = reservationGrade;
    map['id'] = id;
    map['date'] = date;
    map['thumb'] = thumb;
    map['reservation_rate'] = reservationRate;
    return map;
  }
}
