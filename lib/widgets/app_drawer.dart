import 'package:flutter/material.dart';

import '../screens/main_scaffold.dart';
import '../utils/constants.dart';
import 'list_tile_drawer.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  bool value = true;
  Set<String> selected = {"dark"};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 290,
                height: 150,
                child:Center(
                  child: ListTile(
                    leading: CircleAvatar(radius: 24,backgroundColor: Colors.transparent),
                    title: Text("Shashwat Dubey",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    subtitle: Text("shashwatdubey111@gmail.com",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                  ),
                ),
              ),
              ListTileForDrawer(icon: Icons.home_outlined, title: "HomePage", onPressed: (){}),
              ListTileForDrawer(icon: Icons.search_sharp, title: "Discover", onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen(currentIndex: 1,)));
              }),
              ListTileForDrawer(icon: Icons.shopping_cart_sharp, title: "My Orders", onPressed: (){}),
              ListTileForDrawer(icon: Icons.person_outline_sharp, title: "My Profile", onPressed: (){}),
              const SizedBox(height: defaultHeightPadding,),
              const Row(
                children: [
                  //its the default left padding for ListTile widget
                  SizedBox(width: 16,),
                  Text("OTHER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
                ],
              ),
              const SizedBox(height: defaultHeightPadding,),
              ListTileForDrawer(icon: Icons.settings, title: "Settings", onPressed: (){}),
              ListTileForDrawer(icon: Icons.messenger, title: "Support", onPressed: (){}),
              ListTileForDrawer(icon: Icons.info_outline, title: "About us", onPressed: (){}),
              const SizedBox(height: defaultHeightPadding,),
              Center(
                child: SegmentedButton(
                  showSelectedIcon: false,
                  onSelectionChanged: (value){
                    setState(() {
                      selected =value;
                    });
                  },
                  segments: const [
                    ButtonSegment(value: "Light", label: Text("Light"), icon: Icon(Icons.sunny)),
                    ButtonSegment(value: "Dark", label: Text("Dark"), icon: Icon(Icons.mode_night))
                  ], selected: selected,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
