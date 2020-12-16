import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_healthy/src/model/istilah.dart';
import 'package:go_healthy/src/provider/istilah_provider.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/validation/istilah_validation.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:google_fonts/google_fonts.dart';

class IstilahKesehatan extends StatefulWidget {
  final bool isAdmin;

  const IstilahKesehatan({this.isAdmin = false});
  @override
  _IstilahKesehatanState createState() => _IstilahKesehatanState();
}

class _IstilahKesehatanState extends State<IstilahKesehatan> {
  String _currentSearch = "";
  final asset = "assets/images/";
  var tecSearch = TextEditingController();
  final istilahProv = IstilahProvider();

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => showDialog(
                context: context,
                child: DialogIstilah(
                  state: StateIstilah.tambah,
                  istilah: Istilah(namaIstilah: '', penjelasan: ''),
                ),
              ).then((value) => handleRefresh()),
            )
          : null,
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              BackGround(
                title: 'Istilah Kesehatan',
              ),
              BackIconButton(
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                width: size.width,
                child: Stack(
                  children: [
                    _buildBody(),
                    _buildSearchInput(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: MediaQuery.of(context).size.height - 220,
      child: FutureBuilder<List<Istilah>>(
        future: istilahProv.getIstilah(_currentSearch),
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return snapshot.data.isEmpty
                ? NoData(
                    msg: 'Tidak Ada Data!',
                  )
                : _buildListBuilder(snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        },
      ),
    );
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Istilah>> snapshot) {
    return RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return _buildItemList(snapshot.data[index]);
          },
        ));
  }

  Widget _buildItemList(Istilah model) {
    return GestureDetector(
      onLongPress: () => widget.isAdmin
          ? showDialog(
              context: context,
              child: DialogIstilah(
                istilah: model,
                state: StateIstilah.hapus,
              ),
            ).then((value) => handleRefresh())
          : null,
      onDoubleTap: () => widget.isAdmin
          ? showDialog(
              context: context,
              child: DialogIstilah(
                istilah: model,
                state: StateIstilah.edit,
              ),
            ).then((value) => handleRefresh())
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 2.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    model.namaIstilah,
                    style: GoogleFonts.mcLaren(fontSize: 17, color: Colors.red),
                  ),
                ),
                Divider(
                  indent: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    model.penjelasan,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: tecSearch,
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search..",
                  hintStyle: textLabel,
                  prefixIcon: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
                onChanged: (value) {
                  setState(() {
                    _currentSearch = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum StateIstilah {
  edit,
  tambah,
  hapus,
}

class DialogIstilah extends StatefulWidget {
  final Istilah istilah;
  final StateIstilah state;

  const DialogIstilah({this.istilah, @required this.state});
  @override
  _DialogIstilahState createState() => _DialogIstilahState();
}

class _DialogIstilahState extends State<DialogIstilah> with IstilahValidation {
  final formKey = GlobalKey<FormState>();
  final _istilahProvider = IstilahProvider();
  TextEditingController _tecIstilah;
  TextEditingController _tecPenjelasan;
  FocusNode _focIstilah = FocusNode();
  FocusNode _focPenjelasan = FocusNode();
  String _istilah;
  String _penjelasan;
  String _title;
  Widget _content;

  @override
  void initState() {
    _tecIstilah = TextEditingController(text: widget.istilah.namaIstilah);
    _tecPenjelasan = TextEditingController(text: widget.istilah.penjelasan);
    state();
    super.initState();
  }

  void state() {
    switch (widget.state) {
      case StateIstilah.tambah:
        _title = 'Tambah Istilah';
        _content = _buildForm(context);
        break;
      case StateIstilah.edit:
        _title = 'Edit Istilah';
        _content = _buildForm(context);
        break;
      case StateIstilah.hapus:
        _title = 'Hapus Istilah';
        _content =
            Text('Apakah yakin hapus istilah ${widget.istilah.namaIstilah}?');
        break;
      default:
        _title = 'Tambah Istilah';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red[300]),
          ),
        ),
        FlatButton(
          onPressed: widget.state == StateIstilah.hapus
              ? onDeleteIstilah
              : onAddEditIstilah,
          child: Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: _content,
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _tecIstilah,
            focusNode: _focIstilah,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: inputDecoration('Istilah'),
            validator: validateIstilah,
            onSaved: (value) {
              _istilah = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_focPenjelasan);
            },
          ),
          TextFormField(
            controller: _tecPenjelasan,
            focusNode: _focPenjelasan,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            minLines: 3,
            maxLines: 5,
            decoration: inputDecoration('Penjelasan'),
            validator: validatePenjelasan,
            onSaved: (value) {
              _penjelasan = value;
            },
            onEditingComplete: () {
              _focPenjelasan.unfocus();
            },
          ),
        ],
      ),
    );
  }

  void onDeleteIstilah() async {
    await _istilahProvider.deleteIstilah(widget.istilah);
    Navigator.pop(context);
  }

  void onAddEditIstilah() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (widget.state == StateIstilah.tambah) {
        await _istilahProvider.addIstilah(Istilah(
            namaIstilah: _istilah,
            penjelasan: _penjelasan,
            idIstilah: widget.istilah.idIstilah));
      } else {
        await _istilahProvider.updateIstilah(Istilah(
            namaIstilah: _istilah,
            penjelasan: _penjelasan,
            idIstilah: widget.istilah.idIstilah));
      }
      Navigator.pop(context);
    }
  }
}
