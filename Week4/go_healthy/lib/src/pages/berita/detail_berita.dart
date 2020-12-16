import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/provider/berita_provider.dart';
import 'package:go_healthy/src/util/date.dart';

class DetailBerita extends StatefulWidget {
  final Berita model;
  final bool isAdmin;

  const DetailBerita({@required this.model, this.isAdmin = false});
  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  final beritaProvider = BeritaProvider();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.judul),
        actions: [
          widget.isAdmin
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      beritaProvider.deleteBerita(widget.model).then(
                            (value) => Router.navigator.pop(true),
                          ),
                )
              : Container(),
          widget.isAdmin
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Router.navigator
                      .pushNamed(Router.editBerita, arguments: widget.model)
                      .then((value) => Router.navigator.pop(value)),
                )
              : Container(),
        ],
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
                          Text(MyDateFormat()
                              .getFullDate(widget.model.postedAt)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
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
