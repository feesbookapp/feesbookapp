import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddClassScreen extends StatefulWidget {
  const AddClassScreen({Key? key}) : super(key: key);

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  String? errorClassName;
  String? errorClassFee; //= 'Please enter a valid class fee';

  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _classFeeController = TextEditingController();

  final btmPageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _classNameController.dispose();
    _classFeeController.dispose();
    btmPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h * 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: btmPageController,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Class name',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'You can also name your batches according to time.\nEx- Class 12th (6AM)',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xffA7A9B7),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(10, 36, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: TextFormField(
                          controller: _classNameController,
                          decoration: InputDecoration(
                            errorText: errorClassName,
                            alignLabelWithHint: false,
                            border: InputBorder.none,
                            icon: SvgAssetImage(
                              imagePath: 'assets/two_people.svg',
                              height: 25,
                              width: 25,
                            ),
                            hintText: 'Class name',
                          ),
                          style: GoogleFonts.outfit(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      GestureDetector(
                          child: Container(
                            width: w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(18),
                            margin: EdgeInsets.fromLTRB(10, 25, 10, 50),
                            decoration: BoxDecoration(
                              color: Color(0xff006C67),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (_classNameController.text.isEmpty) {
                              setState(() {
                                errorClassName =
                                    'Please enter a valid class name';
                              });
                              return;
                            }

                            if (errorClassName != null) {
                              setState(() {
                                errorClassName = null;
                              });
                            }

                            btmPageController.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeOut,
                            );
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(15, 35, 0, 0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 16,
                                  color: Color(0xff006C67),
                                ),
                                Text(
                                  'Class 12th (6AM)',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color(0xff006C67),
                                          fontSize: 15)),
                                )
                              ],
                            )),
                        onTap: () {
                          btmPageController.previousPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeOut);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Monthly Fees',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'Monthly fees to be collected from the students.\nEx - 500 per month',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(color: Color(0xffA7A9B7))),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(10, 36, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: TextField(
                          maxLength: 10,
                          decoration: InputDecoration(
                            alignLabelWithHint: false,
                            counterText: '',
                            border: InputBorder.none,
                            icon: SvgAssetImage(
                              imagePath: 'assets/inr_round.svg',
                              height: 25,
                              width: 25,
                            ),
                            hintText: '500',
                          ),
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(18),
                          margin: EdgeInsets.fromLTRB(10, 25, 10, 50),
                          decoration: BoxDecoration(
                              color: Color(0xff006C67),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Finish adding class',
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
