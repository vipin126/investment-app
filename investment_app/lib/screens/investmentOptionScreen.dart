
import 'package:flutter/material.dart';

class InvestmentOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                   automaticallyImplyLeading: false,         
                title: Text('Investment Options',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
       backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Learn more about",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 30),),
            Text("Investment Options",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  InvestmentOptionButton('Equity Mutual Fund'),
                  InvestmentOptionButton('Debt Mutual Fund'),
                  InvestmentOptionButton('Public Provident Fund'),
                  InvestmentOptionButton('Sovereign Gold Bonds'),
                  InvestmentOptionButton('REITs'),
                  InvestmentOptionButton('RBI Bonds'),
                  InvestmentOptionButton('Real Estate'),
                  InvestmentOptionButton('Post Office'),
                  InvestmentOptionButton('Pension'),
                  InvestmentOptionButton('Life Insurance'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Know More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
    );
  }
}

class InvestmentOptionButton extends StatelessWidget {
  final String title;

  InvestmentOptionButton(this.title);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to a different screen or perform an action
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.black,
        elevation: 5,
      ),
    );
  }
}