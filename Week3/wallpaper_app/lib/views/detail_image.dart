import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class DetailImage extends StatefulWidget {
  final String nameFile;
  final String kategori;

  const DetailImage({Key key, this.nameFile, this.kategori}) : super(key: key);
  @override
  _DetailImageState createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  static const _url = 'assets/images/';
  static const _format = '.jpg';
  String _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = _url +
        widget.kategori.toLowerCase() +
        '/' +
        widget.nameFile.toLowerCase() +
        _format;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _setWallpaper(),
          icon: Icon(Icons.check),
          label: Text('Set Wallpaper')),
      appBar: AppBar(
        title: Text('Set Wallpaper'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Hero(
            tag: widget.nameFile,
            child: Image.asset(
              _imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _setWallpaper() async {
    String path = _imagePath;
    int location = WallpaperManager
        .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    try {
      result = await WallpaperManager.setWallpaperFromAsset(path, location);
      print(result);
      if (result == 'Wallpaper set') {
        Fluttertoast.showToast(
            msg: result,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      }
    } on PlatformException {
      result = 'Failed to set wallpaper.';
      Fluttertoast.showToast(
          msg: result,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
