import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEF8F8),
        elevation: 0,
        title: Text(
          "",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 23,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Color(0xFF6F5651),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem <int> (
                  value: 0,
                  child: Text("User Login"),
                ),
              ];
            },

            onSelected: (value) {
              if (value == 0) {
                print("user login");
              }
            }
          )
        ],
      ),

    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[Color(0xFFEBBAB5), Color(0xFFFEF8F8)]
        ),
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Jane!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Birthday",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "December 24, 2023",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Weeks Pregnant",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "20 weeks",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Lottie.asset(
                    "assets/images/stork.json",
                    width: 125,
                    height: 125,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text("Scheduled prenatal checkup"),
                  subtitle: Text("May 12, 2023"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/foot.png",
                    color: Colors.grey,
                    height: 26,
                  ),
                  title: Text("Felt baby kick for the first time"),
                  subtitle: Text("May 2, 2023"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add new activity"),
                ),
              ),

              SizedBox(height: 16.0),
              Text(
                'Here are some things you can do:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Card(
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Track Your Due Date'),
                  subtitle: Text('Enter your due date and see how far along you are.'),
                  onTap: () {
                    // Navigate to Due Date Tracking Screen
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.pregnant_woman),
                  title: Text('Track Your Symptoms'),
                  subtitle: Text('Record your symptoms and keep track of how you\'re feeling.'),
                  onTap: () {
                    // Navigate to Symptom Tracking Screen
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Track Your Nutrition'),
                  subtitle: Text('Log what you eat and get recommendations for a healthy pregnancy.'),
                  onTap: () {
                    // Navigate to Nutrition Tracking Screen
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    );
  }
}
