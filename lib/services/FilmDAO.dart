import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../domain/film.dart';

class FilmDAO {

  Future<List<Film>> getAllFilms(http.Client client) async {
    final response = await client.get(Uri.parse('https://ghibliapi.herokuapp.com/films'));
    return compute(parseFilms, response.body);
  }

  List<Film> parseFilms(String responseBody) {
    return jsonDecode(responseBody).map<Film>((json) => Film.fromJson(json)).toList();
  }
}
