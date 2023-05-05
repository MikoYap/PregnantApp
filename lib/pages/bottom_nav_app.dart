import 'package:flutter/material.dart';
import 'home.dart';
import 'gestational_age.dart';
import 'delivery_mode.dart';
import 'diet.dart';



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
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              // Left tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 14),
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
                          size: 20,
                          color: currentTab == 0 ? Color(0xFFD1B7A1) : Colors.grey,
                        ),
                        Text(
                          '  Home  ',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 0 ? Color(0xFFD1B7A1) : Colors.grey),
                        )
                      ],
                    ),
                  ),

                  // Gestational Age icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 8),
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
                          size: 20,
                          color: currentTab == 1 ? Color(0xFFD1B7A1) : Colors.grey,
                        ),
                        Text(
                          'Gestational Age',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 1 ? Color(0xFFD1B7A1) : Colors.grey),
                        )
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
                    padding: EdgeInsets.symmetric(horizontal: 8),
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
                          size: 20,
                          color: currentTab == 2 ? Color(0xFFD1B7A1) : Colors.grey,
                        ),
                        Text(
                          'Delivery Mode',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 2 ? Color(0xFFD1B7A1) : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),

                  // Diet icon
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 22),
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
                          size: 20,
                          color: currentTab == 3 ? Color(0xFFD1B7A1) : Colors.grey,
                        ),
                        Text(
                          'Diet',
                          style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 3 ? Color(0xFFD1B7A1) : Colors.grey
                          ),
                        )
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
