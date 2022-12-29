// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

class Movie {
    Movie({
        this.posterPath,
        required this.overview,
        required this.releaseDate,
        required this.id,
        required this.title,
        required this.voteAverage,
    });

    dynamic posterPath;
    String overview;
    DateTime releaseDate;
    int id;
    String title;
    double voteAverage;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"],
        overview: json["overview"] * 1,
        releaseDate: DateTime.parse(json["release_date"]),
        id: json["id"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "id": id,
        "title": title,
        "vote_average": voteAverage,
    };
}
