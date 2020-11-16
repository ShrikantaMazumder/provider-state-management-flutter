import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_mgmt/provider/eligibility_screen_provider.dart';

class EligiblityScreen extends StatelessWidget {
  final ageInputController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            //if isEligible is null then set orange color else if it is true then set green else red

                            color: (provider.isEligible == null) ? Colors.deepOrange : provider.isEligible ? Colors.greenAccent : Colors.redAccent,
                          ),
                        ),
                        TextFormField(
                          controller: ageInputController,
                          decoration:
                              InputDecoration(hintText: 'Enter your age'),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            onPressed: () {
                              final int age = int.parse(ageInputController.text.trim());
                              provider.checkEligibility(age);
                            },
                            child: Text("Check"),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(provider.eligibilityMessage),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
