import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:investment_app/screens/homepage.dart';

class RiskAssessmentScreen3 extends StatefulWidget {
  @override
  _RiskAssessmentScreenState createState() => _RiskAssessmentScreenState();
}

class _RiskAssessmentScreenState extends State<RiskAssessmentScreen3> {
  double _riskTolerance = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Risk Assessment',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '"Risk tolerance helps us tailor investment options to you"',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Investment type',
                          border: OutlineInputBorder(),
                        ),
                      items: [
                            'Savings',
                            'Long Terms',
                            'financial'
                          ]
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(), // Add your dropdown items here
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Money you can invest from savings',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Financial Goal',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                            'valu 1',
                            'valu 2',
                            'value 3'
                          ]
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(), // Add your dropdown items here
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      Text('Risk tolerance:'),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.pink,
                          inactiveTrackColor: Colors.pink[100],
                          thumbColor: Colors.pink,
                        ),
                        child: Slider(
                          min: 0,
                          max: 10,
                          divisions: 10,
                          value: _riskTolerance,
                          onChanged: (value) {
                            setState(() {
                              _riskTolerance = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0'),
                          Text('10'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
             
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
      bottomNavigationBar:  SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: ()=>Get.to(()=>MainScreen()),
                ),
              ),
    );
  }
}