import 'package:fit_app/ui/common/widgets/text/app_large_text.dart';
import 'package:fit_app/ui/common/widgets/text/app_regular_text.dart';
import 'package:fit_app/utils/exercises_hardcoded_data.dart';
import 'package:fit_app/utils/meals_hardcoded_data.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealsHardcodedData data = MealsHardcodedData();
    var meals = data.meals;

    return Padding(
      padding: const EdgeInsets.all(
        10,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: (context, mealsIndex) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(
                    size: 22,
                    text: meals[mealsIndex]['mealNumber'].toString(),
                    color: Colors.white),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: AssetImage(meals[mealsIndex]['image']),
                    ),
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: meals[mealsIndex]['ingredients'].length,
                    itemBuilder: (context, ingredientsIndex) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.orange),
                        child: Center(
                          child: AppRegularText(
                              text: meals[mealsIndex]['ingredients']
                                  [ingredientsIndex],
                              color: Colors.black,
                              size: 15),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
