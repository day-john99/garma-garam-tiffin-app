import 'package:flutter/material.dart';

class ListTileForDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  const ListTileForDrawer({super.key, required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // todo make this functional based on the selected value;
        color: icon == Icons.home_outlined ? Colors.grey[300] : null,
      ),
      width: double.infinity,
      height: 55,
      child: ListTile(
        onTap: onPressed,
        leading: Icon(icon,size: 28,color: icon == Icons.home_outlined ? Colors.black : Colors.grey,),
        title: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: icon == Icons.home_outlined ? Colors.black : Colors.grey,),),
      ),
    );
  }
}
