import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController updatePh = new TextEditingController();
  TextEditingController updateName = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: getProfile(),
    ));
  }
  Widget getProfile() {

    var w = MediaQuery.of(context).size.width;
    var name = 'Shefali Rawat';
    var phoneNo = 9084856324;
    Color nameClr = Colors.grey;
    // Color phoneClr = Colors.grey;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),

          //Profile pic, name and edit
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                //Profile photo
                Container(
                  height: 86, width: 86,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(43),
                  ),
                ),
                
                //Name and edit
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name.toString(), style: GoogleFonts.inter(textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Color(0xff303030),
                      )),),

                      GestureDetector(
                        child: Row(children: [
                          Text('Change Profile picture', style: GoogleFonts.inter(textStyle: TextStyle(color: Color(0xff006C67))),),
                          SizedBox(width: 5,),
                          Icon(Icons.edit,size: 15,color: Color(0xff006C67),),
                        ],),
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Change Profile photo')));
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 50,),

          //Name of Institute
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name of institute', style: GoogleFonts.inter(textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),),

                  SizedBox(height: 10,),

                  Container(
                    height: 50, width: w,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: nameClr   ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: updateName,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,color: Color(0xff006C67),),
                          suffix: GestureDetector(
                            onTap: () {
                              if(updateName.length==0){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your name'), duration: Duration(milliseconds: 500), backgroundColor: Colors.red.withOpacity(0.5),));
                                nameClr = Colors.red;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Change name'),duration: Duration(milliseconds: 200), backgroundColor: Color(0xff006C67)));
                              }
                            },
                            child: Container(margin: EdgeInsets.only(right: 10) ,child: Text('Change', style: TextStyle(color: Color(0xff006C67)), textAlign: TextAlign.center,),),),
                          hintText: name
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              )
          ),
          //Phone number
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone number', style: GoogleFonts.inter(textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),),

                  SizedBox(height: 10,),

                  Container(
                    height: 50, width: w,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: updatePh,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone,color: Color(0xff006C67),),
                        suffix: GestureDetector(
                            onTap: () {
                              if(updatePh.length==0){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your phone number'), duration: Duration(milliseconds: 500), backgroundColor: Colors.red.withOpacity(0.5),));
                                phoneClr = Colors.red;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Changed phone number'),duration: Duration(milliseconds: 200), backgroundColor: Color(0xff006C67)));
                              }
                            },
                            child: Container(margin: EdgeInsets.only(right: 10) ,child: Text('Change', style: TextStyle(color: Color(0xff006C67)), textAlign: TextAlign.center,),),),
                        hintText: phoneNo.toString()
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              )
          ),
          Center(
            child: Container(
              width: w*0.9,
              margin: EdgeInsets.only(top: 50, bottom: 50),
              height: 1, color: Colors.grey.withOpacity(0.5),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About us',textAlign: TextAlign.start ,style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),),

                const SizedBox(height: 30,),

                Column(
                  children: [
                    //FAQ
                    GestureDetector(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'FAQ',
                          border: InputBorder.none,
                          prefixIcon: SvgPicture.asset('assets/profile.svg'),
                          hintStyle: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 16),),
                          enabled: false,
                        ),
                      ),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Change name')));
                      },
                    ),
                    SizedBox(height: 10,),


                    //Privacy Policy
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Privacy Policy',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Color(0xff006C67),),
                        hintStyle: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 14),),
                        enabled: false,
                      ),
                    ),
                    SizedBox(height: 10,),

                    //Contact us
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Contact Us',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, color: Color(0xff006C67),),
                        hintStyle: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 14),),
                        enabled: false,
                    ),
                  ),

                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
