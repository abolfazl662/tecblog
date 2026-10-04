import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YadGiri extends StatelessWidget {
  // ignore: non_constant_identifier_names, strict_top_level_inference, prefer_typing_uninitialized_variables
  var Rubika;
  // ignore: non_constant_identifier_names
  YadGiri({super.key, required this.Rubika});
  // ignore: non_constant_identifier_names, strict_top_level_inference, prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Rubika),
          Center(
            child: Text("this app isnt complated"),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("سیک به عقب"))
        ],
      ),
    );
  }
  
}