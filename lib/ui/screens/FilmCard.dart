import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/film.dart';
import '../models/FilmModel.dart';

class FilmCard extends StatefulWidget {
  final Film film;
  const FilmCard(this.film, {Key? key}) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  String description = "";
  String runningTime = "";
  String director = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => {
          Provider.of<FilmModel>(context, listen: false).toggleStateOne(widget.film.id)
        },
        child: Card(
          child: Consumer<FilmModel>(
            builder: (context, cart, child) {
              if (cart.isChecked) {
                if (cart.map[widget.film.id] == false) {
                  description = "";
                  runningTime = "";
                  director = "";
                } else {
                  description = widget.film.description;
                  runningTime = "- ${widget.film.runningTime} minutes ";
                  director = "Directed by ${widget.film.director}";
                }
              } else {
                if (cart.map[widget.film.id] == true) {
                  description = widget.film.description;
                  runningTime = "- ${widget.film.runningTime} minutes ";
                  director = "Directed by ${widget.film.director}";
                } else {
                  description = "";
                  runningTime = "";
                  director = "";
                }
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.network(widget.film.image),
                    title: Text("${widget.film.title} (${widget.film.rtScore} %)"),
                    trailing: Text(director),
                    subtitle: Text(description),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("${widget.film.releaseDate} $runningTime"),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}