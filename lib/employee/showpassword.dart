import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ForGetPassword extends StatefulWidget {
  String forgetpassword;
  ForGetPassword(this.forgetpassword, {super.key});

  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/app_icon/loginbackground/1.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
            child: Container(
          width: 600 + 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: ColorPage.buttoncolor1,
              borderRadius: BorderRadius.circular(10)
              // color: Colors.blue,
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Forget Password',
                textScaler: TextScaler.linear(2),
                style: TextStyle(color: ColorPage.white),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                // width: ,
                child: Text(
                  "A verification code has been sent to ${widget.forgetpassword}. Please check your inbox and follow the instructions to complete the verification process.",
                  style: TextStyle(color: Color.fromARGB(255, 176, 174, 174)),
                  textAlign: TextAlign.center,
                  // textScaler: TextScaler.linear(2),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              OtpTextField(
                textStyle: TextStyle(color: ColorPage.white),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                fieldWidth: 50, borderRadius: BorderRadius.circular(10),
                focusedBorderColor: ColorPage.red,
                enabledBorderColor: Colors.grey,
                // enabledBorderColor: ,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 300 - 10,
                  child: ButtonWidget(
                    'Submit',
                    () {},
                    radius: 10,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the email? ",
                    style: TextStyle(color: ColorPage.white),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      ' Click here',
                      style: TextStyle(
                          color: ColorPage.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('Back to log in'))
            ],
          ),
        )),
      ),
    );
  }
}
