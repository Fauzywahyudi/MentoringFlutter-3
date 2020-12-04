import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/informasi.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:flutter/material.dart';

class DetailInformasi extends StatefulWidget {
  final Informasi model;

  const DetailInformasi({@required this.model});
  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.judul),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: widget.model.idInformasi.toString(),
                  child: Image.network(
                    Api.images + widget.model.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.judul,
                      style: textMenu,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "sumber:" + widget.model.sumber,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.model.penjelasan,
                      textAlign: TextAlign.justify,
                    ),
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
