import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  final String image;
  final String title;
  final String tiffinAvailable;
  const CuisineCard({
    super.key, required this.image, required this.title, required this.tiffinAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 90 , child: Center(child: Image.asset(image),)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700),),
          Text("$tiffinAvailable tiffins", style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}