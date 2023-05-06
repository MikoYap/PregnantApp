import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  @override
  _DietTrackerPageState createState() => _DietTrackerPageState();
}

class _DietTrackerPageState extends State<Diet> {
  // Define variables to track user input
  double _caloriesConsumed = 0;
  List<String> _foodsConsumed = [];

  // Define a list of food items to display in the dropdown button
  List<String> _foodItems = [    "IceCream",    "Pizza",    "Beef",    "Chicken",    "Pork",    "Salmon",    "Spaghetti",    "Tuna",    "Chocolate",    "Milk"  ];

  int _calorieLimit = 2000;
  // Define a function to handle adding a food item to the list
  void _addFoodItem(String food) async {
    setState(() {
      double caloriesToAdd = calculateCalories(food);
      // If the limit is not exceeded, add the food item and update the total calories consumed
      // Check if the total calories consumed with the new food item exceeds the limit
      if (_caloriesConsumed + caloriesToAdd > _calorieLimit) {
        // Display an error message if the limit is exceeded
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Warning !!!'),
            content: Text('You have exceeded your daily calorie limit!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),

        );
        _foodsConsumed.add(food);
        _caloriesConsumed += caloriesToAdd;

      } else {
        // If the limit is not exceeded, add the food item and update the total calories consumed
        _foodsConsumed.add(food);
        _caloriesConsumed += caloriesToAdd;
      }
    });
  }


  // Define a function to calculate the calories in a food item
  double calculateCalories(String food) {
    double calories = 0.0;
    if (food == "IceCream") {
      calories += 145.00;
    }
    if (food == "Pizza") {
      calories += 181.00;
    }
    if (food == "Beef") {
      calories += 470.00;
    }
    if (food == "Chicken") {
      calories += 344.00;
    }
    if (food == "Pork") {
      calories += 363.00;
    }
    if (food == "Salmon") {
      calories += 367.00;
    }
    if (food == "Spaghetti") {
      calories += 270.00;
    }
    if (food == "Tuna") {
      calories += 230.00;
    }
    if (food == "Chocolate") {
      calories += 240.00;
    }
    if (food == "Milk") {
      calories += 149.00;
    }
    return calories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFEF8F8),
          elevation: 0,
          title: Text(
            "Diet",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 23,
            ),
          ),
        ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[Color(0xFFEBBAB5), Color(0xFFFEF8F8)]
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50,),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Display the current total calories consumed
                Text(
                  'Total Calories Consumed: $_caloriesConsumed',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                // Display a list of food items consumed
                Expanded(
                  child: ListView.builder(
                    itemCount: _foodsConsumed.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_foodsConsumed[index]),
                        // Optionally, display the calories for each food item
                        subtitle: Text(
                            '${calculateCalories(_foodsConsumed[index])} calories'),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                // Allow the user to add a new food item
                DropdownButton<String>(
                  value: _foodItems[0],
                  onChanged: (String? selectedFoodItem) {
                    _addFoodItem(selectedFoodItem!);
                  },
                  items: _foodItems
                      .map((foodItem) => DropdownMenuItem<String>(
                    value: foodItem,
                    child: Text(foodItem),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}