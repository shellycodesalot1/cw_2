import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Changed theme color to orange
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrangeAccent), // Replaced accentColor
        scaffoldBackgroundColor: const Color(0xFFFFF8E1), // Soft background color
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 16), // Replaced bodyText2 with bodyMedium
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> recipes = const [
    {
      'name': 'Jerked Chicken',
      'image': 'https://www.sweetandsorrel.com/wp-content/uploads/2020/03/BakedJerkChicken-4-scaled.jpg',
      'ingredients': 'Chicken, Jerk seasoning, Garlic, Onion, Thyme',
      'instructions': '1. Season chicken.\n2. Marinate overnight.\n3. Grill until fully cooked.\n4. Serve with rice or vegetables for a full meal.'
    },
    {
      'name': 'Lasagna',
      'image': 'https://cravinghomecooked.com/wp-content/uploads/2019/09/lasagna-1-27.jpg',
      'ingredients': 'Lasagna noodles, Ground beef, Tomato sauce, Cheese',
      'instructions': '1. Cook noodles.\n2. Brown beef and layer ingredients with sauce.\n3. Add cheese layers generously.\n4. Bake for 45 minutes or until bubbling.\n5. Let sit for 10 minutes before serving.'
    },
    {
      'name': 'Baked Mac & Cheese',
      'image': 'https://www.spendwithpennies.com/wp-content/uploads/2022/12/Baked-Mac-and-Cheese-SpendWithPennies-35.jpg',
      'ingredients': 'Macaroni, Cheese, Milk, Butter, Flour',
      'instructions': '1. Cook macaroni al dente.\n2. Make a cheese sauce with butter, flour, and milk.\n3. Stir in shredded cheese until smooth.\n4. Mix with macaroni and bake until golden and crispy.\n5. Top with breadcrumbs for extra crunch.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn to Cook with Shelly'), // Changed the title
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/originals/2e/e9/18/2ee918427712255bc116749e33616d33.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white.withOpacity(0.8), // Make the card semi-transparent
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Image.network(
                      recipes[index]['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      recipes[index]['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            recipe: recipes[index]['name'],
                            ingredients: recipes[index]['ingredients'],
                            instructions: recipes[index]['instructions'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String recipe;
  final String ingredients;
  final String instructions;

  const DetailsScreen({
    required this.recipe,
    required this.ingredients,
    required this.instructions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              ingredients,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              instructions,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Recipes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
