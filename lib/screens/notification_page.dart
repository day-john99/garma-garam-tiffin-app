import 'package:flutter/material.dart';

import '../utils/models/notification_model.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notification = [
      NotificationModel(title: "Good morning! Get 20% Voucher", message: "Launch sale up to 20% off. Limited voucher. \nGet now!!"),
      NotificationModel(title: "Special offer just for you", message: "New Pure-veg Thali 30% off"),
      NotificationModel(title: "Holiday sale 50%", message: "Tap here to get 50% voucher.")
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon : const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
              Navigator.pop(context);
          },),
        title: const Text("Notification", style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: notification.length,
            itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width-32,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification[index].title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                  const SizedBox(height: 10,),
                  Text(notification[index].message, style: const TextStyle(fontWeight: FontWeight.w200),softWrap: true,)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
