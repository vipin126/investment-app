import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/screens/userDetailsPage3.dart';

class RiskAssessmentScreen extends StatefulWidget {
  @override
  _RiskAssessmentScreenState createState() => _RiskAssessmentScreenState();
}

class _RiskAssessmentScreenState extends State<RiskAssessmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedInvestmentHorizon;
  String? _selectedMarketVolatilityReaction;
  String? _selectedInvestmentExperience;
  double _riskTolerance = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.0), // Added some top padding for better visualization
                Text(
                  'Risk Assessment',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  '“Risk tolerance helps us tailor investment options to you”',
                  style: TextStyle(
                    fontSize: 16.0,
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
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Investment horizon',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: ['Short-term', 'Medium-term', 'Long-term']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedInvestmentHorizon = value;
                          });
                        },
                      ),
                      SizedBox(height: 12.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Reaction to market volatility',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: [
                          'Very concerned',
                          'Somewhat concerned',
                          'Not concerned'
                        ]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedMarketVolatilityReaction = value;
                          });
                        },
                      ),
                      SizedBox(height: 12.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Investment Experience',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: [
                          'Beginner',
                          'Intermediate',
                          'Expert'
                        ]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedInvestmentExperience = value;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Risk tolerance :',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Slider(
                            value: _riskTolerance,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: _riskTolerance.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _riskTolerance = value;
                              });
                            },
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
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   // Add your navigation or action code here
                    
                    // }
                    Get.to(()=>RiskAssessmentScreen3());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, size: 12.0, color: Colors.grey),
                    SizedBox(width: 4.0),
                    Icon(Icons.circle, size: 12.0, color: Colors.black),
                    SizedBox(width: 4.0),
                    Icon(Icons.circle, size: 12.0, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 50.0), // Added some bottom padding for better visualization
              ],
            ),
          ),
        ),
      ),
    );
  }
}