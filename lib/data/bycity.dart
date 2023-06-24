import 'package:flutter/material.dart';
class cityweather extends StatefulWidget {
  const cityweather({Key? key}) : super(key: key);

  @override
  State<cityweather> createState() => _cityweatherState();
}

class _cityweatherState extends State<cityweather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter the city',
          fillColor: Colors.white,
          hintStyle: TextStyle(
            color:
              Colors.grey
          )
        ),
      ),
    );
  }
}
