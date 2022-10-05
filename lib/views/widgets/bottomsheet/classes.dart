import 'package:flutter/material.dart';

class classes extends StatefulWidget {
  classes({Key? key}) : super(key: key);

  @override
  State<classes> createState() => _classesState();
}

class _classesState extends State<classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
        backgroundColor: Color(0xff),
      ),
    );
  }
}
