import 'package:exampleapplication/view_model/providers.dart';
import 'package:exampleapplication/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InstituteName extends StatefulWidget {
  const InstituteName({Key? key}) : super(key: key);

  @override
  State<InstituteName> createState() => _InstituteNameState();
}

class _InstituteNameState extends State<InstituteName> {
  TextEditingController _instituteName = new TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: instututeBody(),
      ),
    );
  }

  Widget instututeBody() {
    //Controllers

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    //Theme
    final gre = Colors.grey;

    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: h * 0.1,
        ),

        //illustration
        Container(
          width: w,
          child: Center(
            child: Container(
              width: w * 0.8,
              height: w * 0.8,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/onboarding.png')),
              ),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.1,
        ),

        //Title
        Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          alignment: Alignment.centerLeft,
          child: Text(
            'Your Institute name',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black),
            ),
          ),
        ),

        //SubTitle
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 10),
          child: Text(
            'We would love to hear your name to serve you better',
            style: TextStyle(color: Colors.grey, fontSize: 16, wordSpacing: 1),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        //Phone number
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: gre),
          ),
          child: TextField(
            controller: _instituteName,
            decoration: InputDecoration(
              alignLabelWithHint: false,
              counterText: '',
              border: InputBorder.none,
              hintText: 'Ex. Baba Tutorials',
            ),
            keyboardType: TextInputType.text,
          ),
        ),

        //Button
        Container(
          width: w,
          height: 60,
          margin: EdgeInsets.all(25),
          child: Consumer(builder: (context, ref, _) {
            return ElevatedButton(
              onPressed: () async {
                if (_instituteName.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter your name')));
                  return;
                }

                setState(() {
                  _loading = true;
                });

                await ref
                    .read(appStateViewModelProvider.notifier)
                    .createInstitute(name: _instituteName.text);

                setState(() {
                  _loading = false;
                });

                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Color(0xfff3f3f3),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  context: context,
                  builder: (context) => RegistrationScreen(),
                );
              },
              child: _loading
                  ? const CircularProgressIndicator()
                  : Text(
                      'Get started',
                      style: TextStyle(color: Colors.white),
                    ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xff006C67)),
              ),
            );
          }),
        ),
      ],
    ));
  }
}
