import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NewAlbumScreen extends StatelessWidget {
  const NewAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
        body: Builder(
          builder: (context) =>
              CupertinoPageScaffold(child: Text('dấdsasdasd')),
        ),
      ),
    );
  }
}
