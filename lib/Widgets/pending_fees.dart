import 'package:flutter/cupertino.dart';

class PendingFees extends StatelessWidget {
  const PendingFees({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: 15,
    );
  }
}
