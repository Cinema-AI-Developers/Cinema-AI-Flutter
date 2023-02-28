import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FilmTopResponse {
  final int filmId;
  final String? nameRu;
  final String? nameEn;
  final String? year;
  final String? filmLength;
  final List<String> countries;
  final List<String> genres;
  final int? rating;
  final int? ratingVoteCount;
  final String? posterUrl;
  final String? posterUrlPreview;

  const FilmTopResponse(
      {required this.filmId,
      this.nameRu,
      this.nameEn,
      this.year,
      this.filmLength,
      required this.countries,
      required this.genres,
      this.rating,
      this.ratingVoteCount,
      this.posterUrl,
      this.posterUrlPreview});

  factory FilmTopResponse.fromJson(Map<String, dynamic> json) {
    return FilmTopResponse(
      filmId: json['filmId'] as int,
      nameRu: json['nameRu'] as String?,
      nameEn: json['nameEn'] as String?,
      year: json['year'] as String?,
      filmLength: json['filmLength'] as String?,
      countries: json['countries'] as List<String>,
      genres: json['genres'] as List<String>,
      rating: json['rating'] as int?,
      ratingVoteCount: json['ratingVoteCount'] as int?,
      posterUrl: json['posterUrl'] as String?,
      posterUrlPreview: json['posterUrlPreview'] as String?,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Iterable<FilmTopResponse> parseFilms(String responseBody) {
    final parsed = jsonDecode(responseBody);//.cast<Map<String, dynamic>>();
    print(parsed.map<FilmTopResponse>((json) => FilmTopResponse.fromJson(json)).toList());
    return List<FilmTopResponse>.from(parsed).map((x) => FilmTopResponse.fromJson(x as Map<String, dynamic>));//parsed.map.entrance<FilmTopResponse>((json) => FilmTopResponse.fromJson(json)).toList();
  }

  Future<List<FilmTopResponse>> fetchFilms() async {
    final response = await http.get(
        Uri.parse(
            'https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1'),
        headers: {
          "X-API-KEY": dotenv.env['KINOPOISK_API'].toString(),
          'Accept': "application/json"
        });
    return compute(parseFilms, response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FilmTopResponse>>(
      future: fetchFilms(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return FilmsList(films: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
/*
    Center(
      child: ListView(
        children: [
          for (int x = 1; x <= 10; x++) ...[
            MovieCard(backgroundImg: backgroundImg),
          ],
        ]
        ,
      )
      ,
    );
  }*/
}

class FilmsList extends StatelessWidget {
  const FilmsList({super.key, required this.films});

  final List<FilmTopResponse> films;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: films.length,
      itemBuilder: (context, index) {
        return Image.network(films[index].posterUrlPreview!);
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String backgroundImg;

  const MovieCard({Key? key, required this.backgroundImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
                maxWidth: 64,
                maxHeight: 64,
              ),
              child: Image.network(backgroundImg),
            ),
            title: Text('Fight club 2'),
            subtitle: Text('New movie. Really.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Эта кнопка не работает'),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
