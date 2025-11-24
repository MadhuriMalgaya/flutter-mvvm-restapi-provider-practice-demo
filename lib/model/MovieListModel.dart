class MovieListModel {
  List<Movies>? movies;

  MovieListModel({this.movies});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      for (var v in json['movies']) {
        movies!.add(Movies.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  dynamic contentRating;
  String? duration;
  String? releaseDate;
  double? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  String? imdbRating;
  String? posterurl;

  Movies({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    year = json['year']?.toString();

    // ✅ Safely convert lists
    if (json['genres'] is List) {
      genres = json['genres']
          .map((e) => e.toString())
          .toList()
          .cast<String>();
    }

    if (json['ratings'] is List) {
      ratings = json['ratings']
          .map((e) => (e is int) ? e : (e is double ? e.toInt() : 0))
          .toList()
          .cast<int>();
    }

    poster = json['poster']?.toString();
    contentRating = json['contentRating']?.toString();
    duration = json['duration']?.toString();
    releaseDate = json['releaseDate']?.toString();

    // ✅ Safely parse double
    if (json['averageRating'] is num) {
      averageRating = (json['averageRating'] as num).toDouble();
    } else {
      averageRating = double.tryParse(json['averageRating']?.toString() ?? '0') ?? 0.0;
    }

    originalTitle = json['originalTitle']?.toString();
    storyline = json['storyline']?.toString();

    if (json['actors'] is List) {
      actors = json['actors']
          .map((e) => e.toString())
          .toList()
          .cast<String>();
    }

    imdbRating = json['imdbRating']?.toString();
    posterurl = json['posterurl']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['genres'] = genres;
    data['ratings'] = ratings;
    data['poster'] = poster;
    data['contentRating'] = contentRating;
    data['duration'] = duration;
    data['releaseDate'] = releaseDate;
    data['averageRating'] = averageRating;
    data['originalTitle'] = originalTitle;
    data['storyline'] = storyline;
    data['actors'] = actors;
    data['imdbRating'] = imdbRating;
    data['posterurl'] = posterurl;
    return data;
  }
}
