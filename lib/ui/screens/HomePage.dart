import 'package:fexo3/services/FilmDAO.dart';
import 'package:fexo3/ui/models/FilmModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../domain/film.dart';
import 'FilmCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String description = "";

  @override
  Widget build(BuildContext context) {
    FilmDAO filmDAO = FilmDAO();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.wysiwyg_outlined),
            onPressed: () {
              Provider.of<FilmModel>(context, listen: false).toggleState();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<List<Film>>(
                future: filmDAO.getAllFilms(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: FilmCard(
                                snapshot.data![index]
                            ),
                          );
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Image.network('https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}

