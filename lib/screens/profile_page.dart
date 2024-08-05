import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Map<String, IconData> settingList = {
    "Address" : Icons.location_pin,
    "Payment Method" : Icons.payment_sharp,
    "Voucher" : Icons.local_offer_sharp,
    "My Wishlist" : Icons.favorite,
    "Rate this app" : Icons.star_rate,
    "Log out" : Icons.logout_sharp,
  };

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: defaultHeightPadding,),

        const ListTile(
          leading: CircleAvatar(radius: 24,backgroundColor: Colors.transparent),
          title: Text("Shashwat Dubey",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          subtitle: Text("shashwatdubey111@gmail.com",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          trailing: Icon(Icons.settings),
        ),
       const SizedBox(height: defaultHeightPadding,),
        Card(
          elevation: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width-32,
            height: 350,
            child: ListView.builder(
              itemCount: settingList.length,
                itemBuilder: (context, index){
              return ListTile(
                leading: Icon(settingList.values.elementAt(index), color: Colors.grey,),
                title: Text(settingList.keys.elementAt(index)),
                trailing: index == 5 ? null : const Icon(Icons.chevron_right),
                onTap: (){
                  //todo create a list of function
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
