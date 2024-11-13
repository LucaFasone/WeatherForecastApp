import 'package:flutter/material.dart';
import 'package:weatherapp/screens/base.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(
        child: Text(
          'Forecast Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
