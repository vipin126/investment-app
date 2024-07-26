
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/screens/userDetailsPage2.dart';


class BeforeStartingScreen extends StatefulWidget {
  @override
  State<BeforeStartingScreen> createState() => _BeforeStartingScreenState();
}

class _BeforeStartingScreenState extends State<BeforeStartingScreen> {
final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _selectedGender;
  String? _selectedOccupation;
  String? _selectedMaritalStatus;
  String? _selectedChildren;


  
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 100,),
                Text(
                  'Before Starting',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Let’s know each other !!!',
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
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(
                            child:    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          border: Border.all(color:Colors.black),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _selectedDate == null
                                    ? 'DOB'
                                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            Icon(Icons.calendar_today, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                          ),
                          SizedBox(width: 12.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Gender',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              items: ['Male', 'Female', 'Other']
                                  .map((label) => DropdownMenuItem(
                                        child: Text(label),
                                        value: label,
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Occupation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: ['Employed', 'Self-Employed', 'Student', 'Unemployed']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 12.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Marital Status',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: ['Single', 'Married', 'Divorced', 'Widowed']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 12.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Children',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: ['None', '1', '2', '3', 'More than 3']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your navigation or action code here

                    Get.to(()=>RiskAssessmentScreen());
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
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}