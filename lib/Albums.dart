import 'package:flutter/material.dart';

class Albums extends StatelessWidget {
  final String AlbumContent;
  Albums(this.AlbumContent);

  @override
  Widget build(BuildContext context) {
    return Text(AlbumContent);
  }
}
