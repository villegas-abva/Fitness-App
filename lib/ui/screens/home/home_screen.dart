import 'package:fit_app/ui/screens/exercises/exercises_screen.dart';
import 'package:fit_app/ui/screens/meals/meals_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  var pages = [
    const ExercisesScreen(),
    const MealsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategories(),
              const SizedBox(height: 20),
              pages[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryOption(
            index: 0,
            imagePath: 'assets/images/weights.jpeg',
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            }),
        const SizedBox(
          width: 15,
        ),
        _buildCategoryOption(
            index: 1,
            imagePath: 'assets/images/nutrition.jpeg',
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            }),
      ],
    );
  }

  Widget _buildCategoryOption(
      {required int index,
      required String imagePath,
      required VoidCallback onTap}) {
    return ClipOval(
      child: Material(
        color: Colors.black,
        child: Ink.image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              index == selectedIndex
                  ? Colors.white
                  : Colors.black.withOpacity(0.35),
              BlendMode.dstATop),
          height: 150,
          width: 150,
          child: InkWell(onTap: onTap),
        ),
      ),
    );
  }
}
