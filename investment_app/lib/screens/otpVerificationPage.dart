import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:investment_app/screens/userDetailsPage1.dart';


class OTPVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Image.asset('assets/images/Group 1000004189.png', height: 200.0), // Add your image asset here
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Enter the OTP sent to +2151312125',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
               OtpTextField(
               
        numberOfFields: 5,
        borderColor: Color.fromARGB(255, 245, 142, 8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            // showDialog(
            //     context: context,
            //     builder: (context){
            //     return AlertDialog(
            //         title: Text("Verification Code"),
            //         content: Text('Code entered is $verificationCode'),
            //     );
            //     }
            // );
        }, // end onSubmit
    ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t you receive the OTP?'),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {
                        // Add your resend OTP code here
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    // Add your change mobile number code here
                  },
                  child: Text(
                    'Change mobile number',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Add your verify OTP code here
              Get.to(()=>BeforeStartingScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Button color
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Verify',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}