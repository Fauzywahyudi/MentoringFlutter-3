import 'package:flutter/material.dart';
import 'package:kesehatan_app/api/web_service.dart';

class DetailBerita extends StatefulWidget {
  final data;

  const DetailBerita({Key key, this.data}) : super(key: key);
  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data['judul']),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: size.width,
                child: Hero(
                  tag: widget.data['id_berita'].toString(),
                  child: Image.network(
                    WebService.image + widget.data['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.data['judul']),
                      subtitle: Text('by ' + widget.data['penulis']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.data['sumber']),
                          Text(widget.data['posted_at']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Text(
                  widget.data['isi_berita'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
