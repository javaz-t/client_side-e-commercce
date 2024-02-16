import 'package:client_side/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widgets/otp_form.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(builder: (ctlr) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  const Text('Create Your Account ! !',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  TextField(
                    controller: ctlr.nameCtrl,
                    decoration: InputDecoration(
                      hintText: 'Your Name ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: ctlr.numberCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile ',
              
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  OtpForm(visible: ctlr.otpVisible,),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      if(ctlr.otpVisible){
                        ctlr.addProduct();
                      }else{
                        ctlr.setOtp();
                      }

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)
                          )
                      ),
                    ),
                    child:Text(ctlr.otpVisible?'Regester':'Sent OTP')),

                  SizedBox(height: 20,),
                  TextButton(onPressed: () {
                    Get.to(()=>LoginPage());
                  }, child: Text('Login'))
              
                ],
              ),
            ),

        ),
      );
    });
  }
}
