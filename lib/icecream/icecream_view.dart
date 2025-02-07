import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frost_ice/icecream/model/icecream.dart';

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
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: loadIcreams(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data;
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 3,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final icecream = icecreams![index];
                            return SizedBox(
                              width: 200,
                              child: Card(
                                color: Colors.orange.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    Image.network(icecream.image),],
                                ),
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: icecreams!.length,
                        ),
                      );
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
