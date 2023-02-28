// To parse this JSON data, do
//
//     final filmTopResponse = filmTopResponseFromJson(jsonString);

import 'dart:convert';

class FilmTopResponse {
  FilmTopResponse({
    required this.pagesCount,
    required this.films,
  });

  final int pagesCount;
  final List<Film> films;

  factory FilmTopResponse.fromRawJson(String str) => FilmTopResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FilmTopResponse.fromJson(Map<String, dynamic> json) => FilmTopResponse(
    pagesCount: json["pagesCount"],
    films: List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pagesCount": pagesCount,
    "films": List<dynamic>.from(films.map((x) => x.toJson())),
  };
}

class Film {
  Film({
    required this.filmId,
    this.nameRu,
    this.nameEn,
    this.year,
    this.filmLength,
    required this.countries,
    required this.genres,
    this.rating,
    this.ratingVoteCount,
    this.posterUrl,
    this.posterUrlPreview,
  });

  final int filmId;
  final String? nameRu;
  final String? nameEn;
  final String? year;
  final String? filmLength;
  final List<Country> countries;
  final List<Genre> genres;
  final String? rating;
  final int? ratingVoteCount;
  final String? posterUrl;
  final String? posterUrlPreview;

  factory Film.fromRawJson(String str) => Film.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    filmId: json["filmId"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    year: json["year"],
    filmLength: json["filmLength"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    rating: json["rating"],
    ratingVoteCount: json["ratingVoteCount"],
    posterUrl: json["posterUrl"],
    posterUrlPreview: json["posterUrlPreview"],
  );

  Map<String, dynamic> toJson() => {
    "filmId": filmId,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "year": year,
    "filmLength": filmLength,
    "countries": List<dynamic>.from(countries.map((x) => x)),
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "rating": rating,
    "ratingVoteCount": ratingVoteCount,
    "posterUrl": posterUrl,
    "posterUrlPreview": posterUrlPreview,
  };
}

class Country {
  Country({
    required this.country,
  });

  final String country;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class Genre {
  Genre({
    required this.genre,
  });

  final String genre;

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    genre: json["genre"],
  );

  Map<String, dynamic> toJson() => {
    "genre": genre,
  };
}
