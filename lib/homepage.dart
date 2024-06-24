import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String validPin = '1234';
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI(){
    return SafeArea(
      child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _headingText(),
              const SizedBox(
                height: 20,
              ),
              _subHeadingText(),
              const SizedBox(
                height: 20,
              ),
              _numberText(),
            ],
          ),
         _pinInputForm(),
         _resendCodeLink(),
        ],
          ),
      ),
    );
}
  Widget _headingText(){
      return const Text(
        'Verification',
        style: TextStyle(
          fontWeight: FontWeight.w600, 
          fontSize: 25),
          );
  }
  Widget _subHeadingText(){
      return const Text(
        'Enter the number',
        style: TextStyle(
          fontWeight: FontWeight.w300, 
          fontSize: 15,
          color: Colors.black38,
          ),
          );
  }
  Widget _numberText(){
      return const Text(
        '+91 8178112364',
        style: TextStyle(
          fontWeight: FontWeight.w500, 
          fontSize: 15),
          );
  }
  Widget _resendCodeLink(){
    return Text(
        'Resend Code?',
        style: TextStyle(
          fontWeight: FontWeight.w200, 
          fontSize: 15,
          color: Theme.of(context).colorScheme.primary,
          ),
          );
  }
  Widget _pinInputForm(){
    return Form(
      key: formKey,
      child: Column(
        children: [
      Pinput(
        validator: (value) {
          return value == validPin ? null : "Pin is incorrect";
        },
      ),
      TextButton(
      onPressed: (){
        formKey.currentState!.validate();
      }, 
      child: const Text('Validate'),
    ),
    ],
    ),
    );
  }
}