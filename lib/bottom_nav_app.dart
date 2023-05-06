import 'package:flutter/material.dart';
import 'home.dart';
import 'gestational_age.dart';
import 'delivery_mode.dart';
import 'diet.dart';
import 'food_scanner.dart';



class BottomNavApp extends StatefulWidget {
  const BottomNavApp({Key? key}) : super(key: key);

  @override
  State<BottomNavApp> createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {

  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    GestationalAge(),
    DeliveryMode(),
    Diet(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {

    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: Visibility(
        visible: !showFab,
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 5),
          child: FloatingActionButton(
            heroTag: "foodScannerFab",
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                  size: 25,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF6F5651),
              ),
            ),

            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodScanner()
                    )
                );
              });
            },

          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFEED0CA),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              // Left tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          size: 30,
                          color: currentTab == 0 ? Color(0xFF6F5651) : Colors.grey,
                        ),
                        /*Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 0 ? Color(0xFFF8CBA6) : Colors.grey),
                        )*/
                      ],
                    ),
                  ),

                  // Gestational Age icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = GestationalAge();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                          color: currentTab == 1 ? Color(0xFF6F5651) : Colors.grey,
                        ),
                        /*Text(
                          'Gestational Age',
                          style: TextStyle(
                              fontSize: 10,
                              color: currentTab == 1 ? Color(0xFFF8CBA6) : Colors.grey),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
              // Right tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Mode icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DeliveryMode();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.baby_changing_station,
                          size: 30,
                          color: currentTab == 2 ? Color(0xFF6F5651) : Colors.grey,
                        ),
                        /*Text(
                          'Delivery Mode',
                          style: TextStyle(
                              fontSize: 10,
                              color: currentTab == 2 ? Color(0xFFF8CBA6) : Colors.grey
                          ),
                        )*/
                      ],
                    ),
                  ),

                  // Diet icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Diet();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_dining,
                          size: 30,
                          color: currentTab == 3 ? Color(0xFF6F5651) : Colors.grey,
                        ),
                        /*Text(
                          'Diet',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 3 ? Color(0xFFF8CBA6) : Colors.grey
                          ),
                        )*/
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
