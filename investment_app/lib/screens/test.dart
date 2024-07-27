import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    InvestmentScreen(),
    InvestmentScreen(),
    InvestmentScreen(),
    InvestmentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Investment'),
                      BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Know more'),
                      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                    ],
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.green,
                    unselectedItemColor: Colors.grey,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestmentScreen extends StatelessWidget {
  final dataMap = <String, double>{
    "Stocks": 52,
    "Bonds": 28,
    "Real Estate": 10,
    "Mutual Funds": 8,
    "Others": 2,
  };

  final colorList = <Color>[
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [Icon(Icons.notifications, color: Colors.black)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Vipin',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Investment Capital',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '₹ 1,23,543',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledForegroundColor: Colors.green,
                      ),
                      child: Text('Invest Now'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Our AI Investment Suggestions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.7,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                centerText: "",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Plans tailored for you',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InvestmentPlanCard(
                    title: 'Mutual Fund',
                    amount: '₹64,242',
                    color: Colors.grey.shade300,
                  ),
                  InvestmentPlanCard(
                    title: 'Fixed Deposit',
                    amount: '₹34,592',
                    color: Colors.green.shade300,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InvestmentPlanCard(
                    title: 'Gold bonds',
                    amount: '₹20,000',
                    color: Colors.yellow.shade300,
                  ),
                  InvestmentPlanCard(
                    title: 'REITs',
                    amount: '₹10,000',
                    color: Colors.purple.shade300,
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class InvestmentPlanCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  InvestmentPlanCard({
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Invest :',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Click to know more details',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
