import 'package:client_side/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpForm extends StatelessWidget {

  OtpForm({super.key, required this.visible,});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctl) {
      return Visibility(
        visible: visible,
        child: OtpTextField(
          numberOfFields: 4,
          borderColor: Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            ctl.enteredOtp=verificationCode;
            /*showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              }
          );*/
          }, // end onSubmit
        ),
      );
    });
  }
}
