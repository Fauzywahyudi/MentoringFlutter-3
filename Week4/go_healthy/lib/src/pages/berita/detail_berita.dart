import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/berita.dart';

class DetailBerita extends StatefulWidget {
  final Berita model;

  const DetailBerita({@required this.model});
  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.judul),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: size.width,
                child: Hero(
                  tag: widget.model.idBerita.toString(),
                  child: Image.network(
                    Api.images + widget.model.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.model.judul),
                      subtitle: Text('by ' + widget.model.penulis),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.model.sumber),
                          Text(widget.model.postedAt.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.model.isiBerita,
                    textAlign: TextAlign.justify,
                    style: TextStyle(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
