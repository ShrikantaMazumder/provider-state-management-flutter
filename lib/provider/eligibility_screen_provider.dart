import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String _eligibilityMessage = '';
  bool _isEligible;

  void checkEligibility(int age) {
    if(age > 18)
      eligibleForLicense();
    else
      notEligibleForLicense();
  }

  void eligibleForLicense() {
    _eligibilityMessage = "You are eligible to apply for driving license";
    _isEligible = true;
    notifyListeners();
  }

  void notEligibleForLicense() {
    _eligibilityMessage = "You are not eligible to apply for driving license";
    _isEligible = false;
    notifyListeners();
  }

  // Getting eligible message
  String get eligibilityMessage => _eligibilityMessage;
  bool get isEligible => _isEligible;

}