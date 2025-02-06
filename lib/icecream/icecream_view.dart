import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatefulWidget {
  const IcecreamView({super.key});

  @override
  State<IcecreamView> createState() => _IcecreamViewState();
}

class _IcecreamViewState extends State<IcecreamView> {
  Map<String, dynamic>? decodedIcecreams;
  @override
  void initState() {
    super.initState();
    loadIcecreams();
  }

  Future<void> loadIcecreams() async {
    final rawIcecreams =await rootBundle.loadString("assets/icecream.json");
    decodedIcecreams = jsonDecode(rawIcecreams);
    await Future.delayed(Duration(seconds: 1));
    print("decodedIcecreams");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Icecreams",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "We have something yummy for you ",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Expanded(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (decodedIcecreams != null)
                    Text("Icecreams loaded")
                  else
                    Center(child: CircularProgressIndicator.adaptive())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
