

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/controller/onboardingcontroller.dart';
import 'package:investment_app/screens/SingUpScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var boradingcontorller = Get.put(onboradingContorller());

class onboardingScreen extends StatefulWidget {
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  @override
  Widget build(BuildContext context) {
    //  bool dark = THelperFunctions.isDarkMode(context);
    // TODO: implement build
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: boradingcontorller.pageController,
          children: [
           OnboardingScreen1()
           ,OnboardingScreen2(),
           OnboardingScreen3()
          ],
        ),
//skip button
        Positioned(
            top: 28,
            right: 10,
            child: TextButton(
                onPressed: () => boradingcontorller.onSkip(),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.blue),
                ))),

        //smooth Page indicator (dot navigator)

        Positioned(
            bottom: 30,
            left: 10,
            child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                    activeDotColor: Colors.green, dotWidth: 8, dotHeight: 6,
                    dotColor: Colors.white
                    ),
                    
                controller: boradingcontorller.pageController,
                onDotClicked: boradingcontorller.dotNavigatorClick,
                count: 3)),
        //skip arrow butoom
        onboardingCirluarbutton(),
      ]),
    );
  }
}


class onboardingCirluarbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //bool dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: 30,
        right: 10,
        child: ElevatedButton(
            onPressed: () => boradingcontorller.nexpage(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                //shape: CircleBorder(),
                //fixedSize: Size.fromRadius(34)),
            ),
            child: const Icon(
              Iconsax.arrow_right_3,
              color: Colors.white,
              size: 25,
            )));
  }
}




class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       // padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/money plant.png"), // Add your image asset here
              ),
            ),
            //SizedBox(height: 16.0),
            Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),color: Color(0xff56FF71),),
                height: MediaQuery.of(context).size.height/3.2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Confused about where to invest your savigs",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w400),),
                ),
                

            ),
           
            
          ],
        ),
      ),
    );
  }
}



class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       // padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(child: Stack(children: [
              Positioned(
              //  top: 120,
                bottom: 0,
                left: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Center(child:Text("Real State",style: TextStyle(fontWeight: FontWeight.w600),)),
                  decoration: 
              BoxDecoration(
              
                color: Color(0xffFFCEFA),shape:BoxShape.circle,
                ),
              )),

  Positioned(
                top: 150,
                right: 30,
                child: Container(
                  height: 70,
                  width: 70,
                  child: Center(child:Text("NPS",style: TextStyle(fontWeight: FontWeight.w600),)),
                  decoration: 
              BoxDecoration(
              
                color: Color(0xff9BFFBD),shape:BoxShape.circle,

                
                
                ),
                
              
              )),

Positioned(
                top: 50,
                right: 120,
                child: Container(
                  height: 80,
                  width: 80,
                  child: Center(child:Text("Stocks",style: TextStyle(fontWeight: FontWeight.w600),)),
                  decoration: 
              BoxDecoration(
              
                color: Color(0xffC6E3F9),shape:BoxShape.circle,

                
                
                ),
                
              
              )),
              Positioned(
                top: 170,
                right: 150,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(child:Text("PPF",style: TextStyle(fontWeight: FontWeight.w600),)),
                  decoration: 
              BoxDecoration(
              
                color: Color.fromARGB(255, 251, 211, 186),shape:BoxShape.circle,

                
                
                ),
                
              
              ))




                  ],),)),
                  Flexible(child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/images/A man trades profitable stocks.png")),
                    
Positioned(
                top: 0,
                right: 10,
                child: Container(
                  height: 80,
                  width: 80,
                  child: Center(child:Text("Gold\nbonds",style: TextStyle(fontWeight: FontWeight.w600),)),
                  decoration: 
              BoxDecoration(
              
                color: Color(0xffFDEDB5),shape:BoxShape.circle,

                
                
                ),
                
              
              ))
                    
                    ],
                  )),
                ],
              ),
            ),
            //SizedBox(height: 16.0),
            Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),color: Color(0xff56FF71),),
                height: MediaQuery.of(context).size.height/3.2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Confused about where to invest your savigs",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w400),),
                ),
                

            ),
           
            
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
             // SizedBox(height: 50.0),
              Text(
                'Not anymore !!!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Your Capital',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Our AI Expertise',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Your Profit',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: ()=>Get.to(()=>SignInScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Sign Up Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}