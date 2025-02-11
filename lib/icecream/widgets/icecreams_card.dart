import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frost_ice/icecream/model/icecream.dart';

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.orange.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: icecream.image,
              child: CachedNetworkImage(
                imageUrl: icecream.image,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
                height: 300,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "\$${icecream.price.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
