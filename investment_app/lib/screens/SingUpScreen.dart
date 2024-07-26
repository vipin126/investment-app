import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/screens/otpVerificationPage.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
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
                    'Sign in',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Mobile number',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.green),
                        onPressed: () {
                          // Add your action for entering mobile number
                          Get.to(()=>OTPVerificationScreen());
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      // Add your action for Google Sign-In
                    },
                    child:CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png"),),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  text: 'By proceeding, you agree to our ',
                  children: [
                    TextSpan(
                      text: 'Terms & conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      // Add your navigation to terms and conditions here
                    ),
                    TextSpan(text: ' and confirm you have read our '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      // Add your navigation to privacy policy here
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}