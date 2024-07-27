import 'package:flutter/material.dart';
import 'package:investment_app/provider/investmentProvider.dart';
import 'package:provider/provider.dart';


class InvestmentPage extends StatefulWidget {
  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
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
                'Investment Avenues',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildReturnCalculator(context),
              SizedBox(height: 20),
              Text(
                'Explore Investment Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildInvestmentOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReturnCalculator(BuildContext context) {
    final provider = Provider.of<InvestmentProvider>(context);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ToggleButtons(
            children: [Text('Monthly'), Text('Lumpsum')],
            isSelected: [true, false], // Add your state management for selection
            onPressed: (int index) {},
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Investment Amount'),
            onChanged: (value) {
              provider.setInvestmentAmount(double.parse(value));
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Avg expected return rate (p.a.)',
              suffixText: '%',
            ),
            controller: TextEditingController(text: provider.expectedReturnRate.toString()),
            onChanged: (value) {
              provider.setExpectedReturnRate(double.parse(value));
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Time Period',
              suffixText: 'Yr',
            ),
            onChanged: (value) {
              provider.setTimePeriod(int.parse(value));
            },
          ),
          ElevatedButton(
            onPressed: () {
              final returns = provider.calculateReturns();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Estimated Returns: ₹${returns.toStringAsFixed(2)}'),
                ),
              );
            },
            child: Text('Calculate'),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInvestmentOptionCard('PPF', '7.1%', '15 yrs', 'Tax free', Colors.grey.shade300),
            _buildInvestmentOptionCard('FD', '6.7%', '7D-10Y', 'Diff Slabs', Colors.green.shade300),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInvestmentOptionCard('MF', '7.1%', '15 yrs', 'Tax free', Colors.grey.shade300),
            _buildInvestmentOptionCard('Gold Bonds', '6.7%', '7D-10Y', 'Diff Slabs', Colors.green.shade300),
          ],
        ),
      ],
    );
  }

  Widget _buildInvestmentOptionCard(String title, String returns, String lockInPeriod, String tax, Color color) {
    return Container(
      width: 150,
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
            'Returns : $returns',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Lock-in Period : $lockInPeriod',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Tax : $tax',
            style: TextStyle(
              fontSize: 16.0,
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
