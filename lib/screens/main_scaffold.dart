import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/screens/profile_page.dart';

import '../widgets/app_drawer.dart';
import '../widgets/filter_drawer.dart';
import 'discover_page.dart';
import 'home_page.dart';
import 'my_orders_page.dart';


class HomeScreen extends StatefulWidget {
  final int currentIndex;
  const HomeScreen({super.key, required this.currentIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  //the state of the page is currently not preserved
  //todo either replace BottomNavBar with IndexedStack widget or wrap it with PageView widget
  _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    // TODO: implement initState
    super.initState();
  }
  List<Widget> pages = const [
    HomePage(),
    DiscoverPage(),
    MyOrdersPage(),
    ProfilePage(),
  ];

  List<String> appBarTitle = const [
    "GarmaGaram",
    "Discover",
    "My Orders",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appBarTitle[_selectedIndex], style: _selectedIndex == 0 ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(fontWeight: FontWeight.w400)),
        leading: Builder(
          builder:(context)=> IconButton(
            icon: const Icon(Icons.menu_sharp),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/notification");
          }, icon: const Icon(Icons.notifications_none_sharp)),
        ],
      ),

      drawer: const MyAppDrawer(),
      endDrawer: const FilterDrawer(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2),
            ]
        ),
        child: ClipRRect(
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            enableFeedback: false,
            iconSize: 26,
            selectedIconTheme : const IconThemeData(color: Colors.black),
            unselectedIconTheme: IconThemeData(color: Colors.grey[350]),
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: "discover"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp), label: "myOrders"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp), label: "profile")
            ],
          ),
        ),
      ),

      body: pages[_selectedIndex],
    );
  }
}


