import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Import this
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





// studentOrders
var chef_name = "jessica_fastFoods";
var chef_id = "d646s5dcsds4d62d";
List<String> items = ['maggie','pasta','shake'];
var dt = "05 09 2024 18:05:00";
var order_address = "NearChurch";
int order_mobileno = 99999999 ;
String order_status = "";
var order_id = Uuid();           // generating order uid
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
  //ob.loginPageData( name,  mobileno, email, address, category);
  //ob.customerOrders( chef_name , chef_id , items , dt , order_address , order_mobileno,uniqueId,order_status);
  //ob.customerReviews( chef_name ,chef_id , items ,dt, orderId , review , rating ,uniqueId );
  //ob.dishes(  chef_id , chef_name , dishes , food_ethinicity   ) ;
  ob.setupCollections();
  ob.loginData( email , mobileno );
  ob.accountsData( name , address , category , email , mobileno );
  ob.customerFavRestaurant(  email , fav_chefs );
}



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
}

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
}

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
  void loginData(String email , int mobileno ) async {

    try {
      // uuid creation
      var user_id = Uuid();       // unique id generation
      String uniqueId = await Future.delayed( Duration(seconds: 1), () => user_id.v4());


      // store data in db
      await db.collection("Login data").doc(email).set({
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
        Map<String, dynamic> data = await documentSnapshot.data() as Map<
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
        await db.collection("Customer Fav. Restaurants").doc(email).set({
          "cutomerEmail": email,
          "customerUniqueId": uid_temp,
          "customerFavRestaurant_aka_chefId": fav_chefs
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

  // -----------------------------------------------------------------------------------



  // adds students current order details
  void customerOrders(String chef_name, String chef_id, List<String> items,
      String dt, String order_address, int order_mobileno, uniqueId,
      String order_status) async {
    try {
      // Generate a v4 (random) id
      orderId = await Future.delayed(Duration(seconds: 1), () => order_id.v4());

      // convert dt to DateTime
      // Define the date format based on the input string format
      final DateFormat dateformat = DateFormat('dd MM yyyy HH:mm:ss');
      final DateTime datetime = dateformat.parse(dt);

      // Datetime string dt =  "05 09 2024 18:05:00";

      // Store the data in Firestore
      await FirebaseFirestore.instance.collection('Orders').doc(orderId).set({
        'chefName': chef_name,
        'chefId': chef_id,
        'orderItems': items,
        'orderDateTime': datetime,
        'orderAddress': order_address,
        'customerMobileNo': order_mobileno,
        'customerId': uniqueId,
        'orderStatus': order_status,
        'orderUniqueId': orderId
      }
      );

      print("\nUser order data written successfully.");
    }
    catch (e) {
      print('Error parsing date: $e');
    }
  } // functn end


  // adds students current order details
  void customerReviews(String chef_name, String chef_id, List<String> items, dt,
      orderId, review, rating, uniqueId) async {
    try {
      // convert dt to DateTime
      // Define the date format based on the input string format
      final DateFormat dateformat = DateFormat('dd MM yyyy HH:mm:ss');
      final DateTime datetime = dateformat.parse(dt);

      // Datetime string dt =  "05 09 2024 18:05:00";

      // Store the data in Firestore
      await FirebaseFirestore.instance.collection('Reviews').doc().set({
        'chefName': chef_name,
        'chefId': chef_id,
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


  // adds students current order details
  void dishes(chef_id, chef_name, List<String> dishes,
      List<String> food_ethinicity) async {
    try {
      // Store the data in Firestore with each doc unique to chef_id thus data overwritten when editing
      await FirebaseFirestore.instance.collection('Dishes').doc(chef_id).set({
        'chefId': chef_id,
        'chefName': chef_name,
        'dishes': dishes,
        'foodEthinicity': food_ethinicity
      }

      );

      print("\nDishes by chef written successfully.");
    }
    catch (e) {
      print('Error parsing date: $e');
    }
  } // functn end


}



