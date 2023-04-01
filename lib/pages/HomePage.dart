import 'dart:convert';
import 'dart:io';

import 'package:cinema_ai/api/FilmTopResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<FilmTopResponse> fetchFilms() async {
    final response = await http.get(
        Uri.parse(
            'https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1'),
        headers: {
          "X-API-KEY": dotenv.env['VITE_KINOPOISK_API'].toString(),
          'Accept': "application/json"
        }).then((data) => jsonDecode(data.body));

    final filmTopResponse = FilmTopResponse.fromJson(response);
    print(filmTopResponse);
    return filmTopResponse;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmTopResponse>(
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

  final FilmTopResponse films;

  @override
  Widget build(BuildContext context) {
    final List<Film> filmList = films.films;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: filmList.length,
      itemBuilder: (context, index) {
        final currentFilm = filmList[index];
        return MovieCard(
            backgroundImg: currentFilm.posterUrlPreview!,
            name: currentFilm.nameEn!,
            year: currentFilm.year!);
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String backgroundImg;
  final String name;
  final String year;

  const MovieCard(
      {Key? key,
      required this.backgroundImg,
      required this.name,
      required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.network(backgroundImg, height: 80),
          ),
          Container(
            child: ListTile(
              title: Text(name),
              subtitle: Text(year),
            ),
          ),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Смотреть'),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),*/
        ],
      ),
    );
  }
}
