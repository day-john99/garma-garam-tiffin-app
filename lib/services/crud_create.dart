import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';          // DateTime settings
import 'package:uuid/uuid.dart';          // for uuid generation




// declaring all global variables
final db = FirebaseFirestore.instance;


// loginData functn
String email = "test@email";
int mobileno = 5555422952;
var user_id ;         // not a string but something unique combination
String uniqueId = "";

// accountsData functn
var name = "lucy";
var address = "street101";
var category = "chef";
var uid_temp;

// customerFavRestaurant functn
var fav_chefs=[];
String temp_category = "chef";

// customerOrders functn
var order_id;       // some unique combinations
String order_id_final = "";
final DateFormat dateformat = DateFormat('dd MM yyyy HH:mm:ss'); // Define the date format based on the input string format
String ordertype="subscription";
String customer_id="ds56f165s13c0354";
String restaurant_id="62262ff";
String menu_item_id="22aa";
String dt_order_placed="05 09 2024 18:05:00";
String dt_order_to_be_delivered="05 09 2024 18:05:00";
String dt_order_actual_time_of_delivery="05 09 2024 18:05:00";
String veg_nonveg="";
int days_subscribed_for=25;
String order_status = "cooking" ; // possible order status are : cooking , dispatched , delivered
List<String> dt_orders_skipped=[];
List<String> past_orders=[];

// homeRestaurants functn
String chef_restaurant_id="";
String chef_email="test@email";
String restaurant_name = "foodLibs";
bool is_veg=true;
bool is_available_tomorrow=true;
int max_customers_capacity=20;
List<Map<String, dynamic>> menu = [ { "thaliName":"basic","thaliItems":['dal','roti','sabji'] , "thaliPrice":2500 ,"thaliID":"2ds4d96s2d"}
                                ,{ "thaliName":"basic","thaliItems":['dal','roti','sabji','rice'] , "thaliPrice":3000 ,"thaliID":"5d5d5"}
                      ,{ "thaliName":"basic","thaliItems":['dal','roti','sabji','rice','salad'] , "thaliPrice":3500 ,"thaliID":"a65s8s6"} ];






// studentOrders
var chef_name = "jessica_fastFoods";
var chef_id = "d646s5dcsds4d62d";
List<String> items = ['maggie','pasta','shake'];
var dt = "05 09 2024 18:05:00";
var order_address = "NearChurch";
int order_mobileno = 99999999 ;
//String order_status = "";
// var order_id = Uuid();           // generating order uid
String orderId = "";             // storing order_id

// studentReviews
var review = "ghatiya";
int rating = 4;

// dishes
List<String> dishes = [] ;
List<String> food_ethinicity = [];




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  } catch (e) {
  print('Firebase initialization error: $e');
  }
  runApp(MyApp());
  var ob = UserProvider();


  ob.setupCollections();
  ob.loginData( email , mobileno );
  ob.accountsData( name , address , category , email , mobileno );
  ob.customerFavRestaurant(  email , fav_chefs );
  ob.customerOrders( ordertype , customer_id , restaurant_id
      , menu_item_id , address , mobileno , order_status
      , dt_order_placed, dt_order_to_be_delivered
      , dt_order_actual_time_of_delivery
      , veg_nonveg , days_subscribed_for
      , dt_orders_skipped
      , past_orders                    );
  ob.homeRestaurants( chef_email , restaurant_name
      , is_veg ,  is_available_tomorrow , max_customers_capacity
      ,  menu );
  //ob.customerReviews( chef_name ,chef_id , items ,dt, orderId , review , rating ,uniqueId );
  ob.getAvailableRestaurants();
  ob.getOrderStatus(order_status);

}// main ends






class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'User Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}// class ends

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can access the UserProvider instance here
    var userProvider = Provider.of<UserProvider>(context);



    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${name}'),
            Text('Mobile No: ${mobileno}'),
            // Other user data can be displayed similarly
          ],
        ),
      ),
    );
  }
}// class ends

class UserProvider with ChangeNotifier {




  // BASIC COLLECTIONS SETUP  --------------------------------------------------
  void setupCollections() async {

  try{

    await db.collection('Login data').doc('empty').set({});
    await db.collection('Accounts data').doc('empty').set({});
    await db.collection('Home Restaurants').doc('empty').set({});
    await db.collection('Customer Orders').doc('empty').set({});
    await db.collection('Customer Reviews').doc('empty').set({});
    await db.collection('Customer Fav. Restaurants').doc('empty').set({});


  } // try end
  catch (e) {
    print("Failed to make collections : $e");
  }  // catch end

  } // functn end





  // POST functions  -----------------------------------------------------------

  // 3 entitites are there - users , flutter , db ;who enters functn parameters of below functns

  // user/customer/chef enters email and mobileno and db itself generates uid
  void loginData(String email , int mobileno )  {

    try {
      // uuid creation
      var user_id = Uuid();       // unique id generation
      String uniqueId =  user_id.v4();


      // store data in db
       db.collection("Login data").doc(email).set({
        "userMobileNo": mobileno,
        "userEmail": email,
        "userUniqueId": uniqueId
      }
      );

     print("\n login data written successful with uid $uniqueId");
    } // try ends
    catch (e) {
      print("Failed to write login data: $e");
    } // catch end

  }// loginData functn ends



  /* user/customer enters fav restaurants,we store restaurants uid/chef uid (this is
  equal to users with category as chef and their uid is same as restaurant uid);
  flutter enters/provides customer email;
  db provides the uid of customer using its email
  * */
  void customerFavRestaurant( String email , var fav_chefs ) async {

    // Delay for 1 second
    await Future.delayed(Duration(milliseconds: 1000));


    try {
      // find uniqueId in Logindetails collection

      // Reference the specific document in the collection
      DocumentSnapshot documentSnapshot = await db.collection("Accounts data")
          .doc(email)
          .get();
      // print("\n snapshot : $documentSnapshot.data");

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access the data
        Map<String, dynamic> data =  documentSnapshot.data() as Map<
            String,
            dynamic>;

        // Example: Access specific fields
        uid_temp = data["userUniqueId"];
        temp_category = data["userCategory"];
      } // if ends
      print("\n uid inside cust fav restau functn: $uid_temp"); // debug statement
      print("\n userCategory : $temp_category"); // debug statement



      // store data in db only if email category is chef
      if (temp_category == "chef") {
          db.collection("Customer Fav. Restaurants").doc(email).set({
          "cutomerEmail": email,
          "customerUniqueId": uid_temp,
          "customerFavRestaurantId_or_chefId": fav_chefs
        }
        );
    } // if ends

      print("customer fav restau. data written successfully.");                                 // debug statement
    } // try ends

        catch (e) {
      print("Failed to write account data: $e");
    } // catch ends

  } // customerFavRestaurant functn ends



  /* user/customer/chef enters name,address,category while  email,mobileno thats
  already entered during loginData is used to find uniqueId of user and
  store in db
  * */
  void accountsData(String name, String address, String category ,String email , int mobileno  ) async {

    try {

      // find uniqueId in Logindetails collection

      // Reference the specific document in the collection
      DocumentSnapshot documentSnapshot = await db.collection("Login data").doc(email).get();
      // print("\n snapshot : $documentSnapshot.data");

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access the data
        Map<String, dynamic> data = await documentSnapshot.data() as Map<
            String,
            dynamic>;

        // Example: Access specific fields
        uid_temp = data["userUniqueId"];
      }

      print("\n uid inside accnt functn : $uid_temp");                                             // debug statement
      // store data in db
      await db.collection("Accounts data").doc(email).set({
        "userName": name,
        "userAddress": address,
        "userMobileno": mobileno,
        "userEmail": email,
        "userCategory": category, // chef or customer
        "userUniqueId": uid_temp

      }
      );

      print("account data written successfully.");                                 // debug statement
    }

    catch (e) {
      print("Failed to write account data: $e");
    } // catch ends

  } // functn ends



  /* user/customer provides ordertype
     flutter provides order_status,time_order_placed,time_order_to_be_delivered,time_actual_time_of_delivery
     db provides uid_chef , uid_customer , uid_thali , uid_order ,veg_nonveg_type
  * */
  void customerOrders(String ordertype ,String customer_id ,String restaurant_id
      ,String menu_item_id , String address ,int mobileno , String order_status
      ,String dt_order_placed,String dt_order_to_be_delivered
      ,String dt_order_actual_time_of_delivery
      ,String veg_nonveg ,int days_subscribed_for
      , List<String> dt_orders_skipped
      , List<String> past_orders                    )  {


    try{

      // uid generation for each order
      var order_id = Uuid();       // unique id generation
      order_id_final =  order_id.v4();

      // convert dt to DateTime
      // Datetime string dt_order_placed =  "05 09 2024 18:05:00";
      final DateTime DT_order_placed = dateformat.parse(dt_order_placed);
      final DateTime DT_order_to_be_delivered = dateformat.parse(dt_order_to_be_delivered);
      final DateTime DT_order_actual_time_of_delivery = dateformat.parse(dt_order_actual_time_of_delivery);


      // store data in db
       db.collection("Customer Orders").doc(order_id_final).set({
        "customerOrderId": order_id_final,
        "customerOrdertype": ordertype,
        "customerId":customer_id,
        "restaurantID":restaurant_id,
        "customerCurrentOrderItems":menu_item_id,    // orderitems contain uid of a unique item of restaurant menu
        "customerAddress":address,
        "customerMobileno":mobileno,
        "customerOrderStatus": order_status,
        "orderPlacedTime":DT_order_placed,
        "orderTimeToBeDelivered":DT_order_to_be_delivered,
        "orderActualTimeOfDelivery":DT_order_actual_time_of_delivery,
        "orderVegNonveg": veg_nonveg,
        "daysSubscribedFor ":days_subscribed_for ,      // only for subscription model else null
        "datetimeOrdersSkipped":dt_orders_skipped ,     // only for subscription model else null
        "pastOrdersIdList":past_orders,                 // only for subscription model else null
        // past_orders conatin orderIds of previous orders
      }
      );


      print("\n customer orders written successfully");
    }// try ends


    catch (e) {
      print("Failed to write customer orders in db due to: $e");
    }//catch ends


  }// functn ends






  /*
   menu list will contain dictionaries of this type shownn below
    List<Map<String, dynamic>> menu = [ { "thaliName":"basic","thaliItems":['dal','roti','sabji'] , "thaliPrice":2500 ,"thaliID":"2ds4d96s2d"}
                                ,{ "thaliName":"basic","thaliItems":['dal','roti','sabji','rice'] , "thaliPrice":3000 ,"thaliID":"5d5d5"}
                      ,{ "thaliName":"basic","thaliItems":['dal','roti','sabji','rice','salad'] , "thaliPrice":3500 ,"thaliID":"a65s8s6"} ];

  * */
  void homeRestaurants(String chef_email , String restaurant_name
      ,bool is_veg , bool is_available_tomorrow , int max_customers_capacity
      , List<Map<String, dynamic>> menu ) async {

    try {

      //via provided email ,find userUniqueId  in Accounts data collection

      // Reference the specific document in the collection
      DocumentSnapshot documentSnapshot = await db.collection("Accounts data").doc(
          email).get();
      // print("\n snapshot : $documentSnapshot.data");

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access the data
        Map<String, dynamic> data = await documentSnapshot.data() as Map<
            String,
            dynamic>;

        // Example: Access specific fields
        chef_restaurant_id = data["userUniqueId"];
      } // if ends


      // store data in db
      await db.collection("Home Restaurants").doc(chef_email).set({
        "chefEmail": chef_email,
        "chef_restaurantUniqueId": chef_restaurant_id,
        "restaurantName": restaurant_name,
        "restaurantIsVeg": is_veg,
        "chefAvailableTomorrow": is_available_tomorrow,
        "restaurantMaxCapacity": max_customers_capacity, // chef or customer
        "menuItems":menu,

      }, SetOptions(merge: true)
      );

      print("\n successfully stored in db, homeRestaurants data");

    }// try ends
    catch (e) {
      print("\nFailed to store HomeRestaurants data: $e");
    }//catch ends



  }// functn ends



  // -----------------------------------------------------------------------------------


  // adds students current order details
  void customerReviews(String chef_name, String chef_restaurant_id, List<String> items, dt,
      orderId, review, rating, uniqueId) async {
    try {
      // convert dt to DateTime
      // Define the date format based on the input string format
      final DateFormat dateformat = DateFormat('dd MM yyyy HH:mm:ss');
      final DateTime datetime = dateformat.parse(dt);

      // Datetime string dt =  "05 09 2024 18:05:00";

      // Store the data in Firestore
      await db.collection('Reviews').doc().set({
        'chefName': chef_name,
        'chefId': chef_restaurant_id,
        'orderItems': items,
        'orderId': orderId,
        'orderReviews': review,
        'orderDateTime': datetime,
        'orderStarRating': rating,
        'customerId': uniqueId
      }

      );

      print("\nUser review data written successfully.");
    }
    catch (e) {
      print('Error parsing date: $e');
    }
  } // functn end

//-------------------------------------------------------------------------------------------------------------------------

// GET functns

  void getAvailableRestaurants() async {

    try {
      // Query to get available restaurants/chefs
      QuerySnapshot<Map<String, dynamic>> availableRestaurant = await db
          .collection('Home Restaurants')
          .where("chefAvailableTomorrow", isEqualTo: true)
          .get();

      // Printing each document in the query result
      for (var doc in availableRestaurant.docs) {
        // Each `doc` is a DocumentSnapshot
        Map<String, dynamic>? data = doc.data();

        print('\nDocument ID: ${doc.id}');
        print('\nDocument Data: $data');
        print('---');
      } // for ends

      print("\n successfully got restaurant active status ");

    }// try ends
    catch (e) {
      print("\n failed getting restaurant active status: $e  ");
    }


  }// functn ends


  /* gets all order docs from Customer Orders collection where ,order_status
   is : cooking , dispatched , delivered  */
  void getOrderStatus(String order_status) async {

    try {

      // Query to get available restaurants/chefs
      QuerySnapshot<Map<String, dynamic>> availableRestaurant = await db
          .collection('Customer Orders')
          .where("customerOrderStatus", isEqualTo: order_status )
          .get();

      // Printing each document in the query result
      for (var doc in availableRestaurant.docs) {
        // Each `doc` is a DocumentSnapshot
        Map<String, dynamic>? data = doc.data();

        print('\nDocument ID: ${doc.id}');
        print('\nDocument Data: $data');
        print('---');
      } // for ends



      print("\n Successfully got Order Status data");
    }// try ends
    catch (e) {
      print("\n Failed getting Order Status");
    }// catch ends


  }// functn ends








} // class ends



