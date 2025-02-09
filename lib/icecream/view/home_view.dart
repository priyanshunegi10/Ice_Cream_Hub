import 'package:flutter/material.dart';
import 'package:frost_ice/icecream/view/icecream_view.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: IcecreamView()
      ),
    );
  }
}