import 'package:flutter/cupertino.dart';
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

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }

  Widget getBody() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
                      height: 84,
                      width: w/2-23,
                      padding: EdgeInsets.only(top: 15, left: 12) ,
                      decoration: BoxDecoration(
                        color: Color(0xffFCEEEE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pending fees', style: TextStyle(color: Color(0xff9D0709), fontSize: 14, fontWeight: FontWeight.w500),),
                          SizedBox(height: 6,),
                          Text('₹2,244', style: TextStyle(color: Color(0xffAC0806), fontWeight: FontWeight.bold, fontSize: 24),)
                        ],),
                    ),
                    //Green box
                    Container(
                      height: 84,
                      width: w/2-23,
                      padding: EdgeInsets.only(top: 15, left: 12) ,
                      decoration: BoxDecoration(
                        color: Color(0xffE9EDEC),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Total collected', style: TextStyle(color: Color(0xff1C504B), fontSize: 14, fontWeight: FontWeight.w500),),
                          SizedBox(height: 6,),
                          Text('₹10,000', style: TextStyle(color: Color(0xff006C67), fontWeight: FontWeight.bold, fontSize: 24),)
                        ],),
                    ),
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

              //Student info
              Container(
                  width: w,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 1, blurRadius: 10)],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Harshit Pathak', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                        const SizedBox(height: 8,),
                        const Text('Physics', style: TextStyle(color: Colors.grey, fontSize: 16,),),
                        const SizedBox(height: 12,),
                        const Text('6/10 paid', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                        const SizedBox(height: 8,),
                        SvgPicture.asset('img/progress.svg'),
                        const SizedBox(height: 26,),
                        Container(height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffE6F0F0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                              child: RichText(text: TextSpan(children: [TextSpan(text: "View", style: TextStyle(color: Color(0xff09635E), fontSize: 16,)),WidgetSpan(child: Icon(Icons.arrow_forward, size: 16, color: Color(0xff09635E),),),],),)
                          ),
                        ),
                        const SizedBox(height: 14,),
                        Center(child: Text('Add Student', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),)),
                        const SizedBox(height: 26,),
                      ],
                    ),
                  )
              )
            ],
          ),
        )
      ],
    );
  }

}
