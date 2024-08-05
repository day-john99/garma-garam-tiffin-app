import 'package:flutter/material.dart';

import '../utils/constants.dart';
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<bool> isExpanded = [false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search_sharp),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                      ),
                      child: IconButton(
                        icon : Icon(Icons.tune_sharp,color: Colors.grey[600]),
                        onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    )

                  ],
                ),
                const SizedBox(height: defaultHeightPadding,),
                const Center(child: Text("Currently empty"),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
