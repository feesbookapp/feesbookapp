import 'package:flutter/material.dart';

class Batches extends StatelessWidget {
  final String name;
  final String subject;
  final String studentNum;
  final String paidNum;
  final link;

  const Batches(
      {super.key,
      required this.name,
      required this.subject,
      required this.paidNum,
      required this.link,
      required this.studentNum});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.person,
                  size: 22,
                  color: Colors.grey,
                ),
                Text('$studentNum students')
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '$paidNum paid',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffE6F0F0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "View ",
                          style: TextStyle(
                            color: Color(0xff09635E),
                            fontSize: 16,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xff09635E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => link),
                );
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Text(
                'Add Student',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
