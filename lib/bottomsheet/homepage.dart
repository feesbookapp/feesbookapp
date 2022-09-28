import 'package:exampleapplication/bottomsheet/classes.dart';
import 'package:exampleapplication/bottomsheet/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screens = [
      getBody(),
      classes(),
      Profile(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xff0D5F5A),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined),label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.monitor),label: 'Classes'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },

        ),
      )
    );
  }

  Widget getBody() {
    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          color: Color(0xffF8F9FB),
          child: Column(
            children: [
              SizedBox(height: 60,width: w,),
              //Safe area
              //Class, back button and view full report
              Row(
                children: [
                  const SizedBox(width: 16,),
                  SvgPicture.asset("img/back.svg"),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Class 12th (6AM)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                      RichText(text: TextSpan(children: [TextSpan(text: "View full report", style: TextStyle(color: Color(0xff006C67), fontSize: 16,)),WidgetSpan(child: Icon(Icons.arrow_forward_ios_outlined, size: 14),),],),)

                    ],
                  )
                ],
              ),

              //Red and green box
              Container(
                width: w,
                margin: EdgeInsets.only(left: 16, right: 16, top: 26),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Red box
                    Container(
                      child: FeesInfo(Color(0xffFCEEEE), 'Pending Fees', '2,244', Color(0xff9D0709)),
                      height: 84, width: w/2 -22,
                    ),
                    //Green box
                    Container(
                      height: 84, width: w/2 - 22,
                      child: FeesInfo(Color(0xffE9EDEC), 'Total collected', '10,000', Color(0xff006C67)),
                    )
                  ],),
              ),

              const SizedBox(height: 36,),
            ],
          ),
        ),
        Container(
          width: w,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 24,),

              //Students + add class
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Students', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),),
                      Text('+ Add class', style: TextStyle(color: Color(0xff006C67), fontSize: 16, fontWeight: FontWeight.w400),),
                    ],)),
              const SizedBox(height: 24,),

              //Students info

            ],
          ),
        )
      ],
    );
  }

}
class FeesInfo extends StatelessWidget {

  final Color backgroundColor, textColor;
  final title;
  final amount;
  FeesInfo(this.backgroundColor, this.title, this.amount, this.textColor);

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 15, left: 12) ,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toString(), style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500),),
          SizedBox(height: 6,),
          Text(amount.toString(), style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 24),)
        ],),
    );
  }
}

