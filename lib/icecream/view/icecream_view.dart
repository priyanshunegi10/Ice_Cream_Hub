import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frost_ice/icecream/model/icecream.dart';
import 'package:frost_ice/icecream/view/icecream_detail_view.dart';
import 'package:frost_ice/icecream/widgets/icecreams_card.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<List<Icecream>?> loadIcreams() async {
    final rawIcecreams = await rootBundle.loadString('assets/icecream.json');
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = icecreamsDataFromJson(rawIcecreams);
    return icecreams.icecreams;
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
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: loadIcreams(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final icecreams = snapshot.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height / 2,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    final icecream = icecreams[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IcecreamDetailView(
                                                    icecream:
                                                        icecream),
                                          ),
                                        );
                                      },
                                      child: IcecreamCard(icecream: icecream),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: icecreams!.length,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        }
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
