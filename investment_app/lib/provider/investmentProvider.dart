import 'package:flutter/material.dart';

class InvestmentProvider with ChangeNotifier {
  double _investmentAmount = 0.0;
  double _expectedReturnRate = 13.5;
  int _timePeriod = 1;

  double get investmentAmount => _investmentAmount;
  double get expectedReturnRate => _expectedReturnRate;
  int get timePeriod => _timePeriod;

  void setInvestmentAmount(double amount) {
    _investmentAmount = amount;
    notifyListeners();
  }

  void setExpectedReturnRate(double rate) {
    _expectedReturnRate = rate;
    notifyListeners();
  }

  void setTimePeriod(int period) {
    _timePeriod = period;
    notifyListeners();
  }

  double calculateReturns() {
    return _investmentAmount * _expectedReturnRate * _timePeriod / 100;
  }
}
