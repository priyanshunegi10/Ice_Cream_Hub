import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<Map<String, dynamic>> loadIcreams() async {
    final rawIcecreams = await rootBundle.loadString('assets/icecreams.json');
    await Future.delayed(const Duration(seconds: 1));
    final decodedIcecreams = jsonDecode(rawIcecreams);
    return decodedIcecreams;
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
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "We have something yummy for you",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: loadIcreams(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data as Map<String, dynamic>;
                      return Text(icecreams["icecreams"][0]["flavor"]);
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
