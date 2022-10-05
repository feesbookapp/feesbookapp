import 'package:exampleapplication/Widgets/fees_history.dart';
import 'package:exampleapplication/Widgets/pending_fees.dart';
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
        backgroundColor: Color(0xff303030),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          PendingFees(startMonth: 'May', endMonth: 'June', fees: 500),
          FeesHistory(month: 'June', fees: 450)
        ],
      ),
    );
  }
}
