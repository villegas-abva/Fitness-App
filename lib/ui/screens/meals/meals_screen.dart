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
          return Container();
          // return Padding(
          //   padding: const EdgeInsets.only(
          //     left: 15,
          //     bottom: 30,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Meal #
          //       AppLargeText(
          //           size: 22,
          //           text: meals[mealsIndex]['meal'],
          //           color: Colors.white),
          //       const SizedBox(height: 10),
          //       SizedBox(
          //         height: 200,
          //         width: double.infinity,
          //         child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount:
          //                 day['muscles'][muscleIndex]['exercises'].length,
          //             itemBuilder: (context, exerciseIndex) {
          //               return Padding(
          //                 padding: const EdgeInsets.only(right: 12.0),

          //                 // Image
          //                 child: Stack(
          //                   children: [
          //                     Container(
          //                       decoration: BoxDecoration(
          //                           image: DecorationImage(
          //                             fit: BoxFit.cover,
          //                             colorFilter: ColorFilter.mode(
          //                                 Colors.black.withOpacity(0.5),
          //                                 BlendMode.dstATop),
          //                             image: AssetImage(day['muscles']
          //                                     [muscleIndex]['exercises']
          //                                 [exerciseIndex]['image']),
          //                           ),
          //                           color: Colors.white10,
          //                           borderRadius: BorderRadius.circular(20)),
          //                       padding: const EdgeInsets.all(10),
          //                       width: 280,

          //                       // Exercise
          //                       child: Center(
          //                         child: AppRegularText(
          //                             text: day['muscles'][muscleIndex]
          //                                     ['exercises'][exerciseIndex]
          //                                 ['exercise'],
          //                             color: Colors.white,
          //                             size: 22),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       top: 10,
          //                       right: 10,
          //                       child: Container(
          //                         padding: const EdgeInsets.all(5),
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(20),
          //                             color: Colors.orange),
          //                         child: AppRegularText(
          //                             text:
          //                                 '${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['sets']} x ${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['reps']} reps',
          //                             color: Colors.black,
          //                             size: 13),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       bottom: 10,
          //                       right: 10,
          //                       child: Container(
          //                         padding: EdgeInsets.all(5),
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(20),
          //                             color: Colors.orange),
          //                         child: Row(
          //                           children: [
          //                             Icon(Icons.watch),
          //                             SizedBox(width: 5),
          //                             AppRegularText(
          //                                 text:
          //                                     '${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['rest']} rest',
          //                                 color: Colors.black,
          //                                 size: 13),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             }),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
