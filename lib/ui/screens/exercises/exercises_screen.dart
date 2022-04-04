import 'package:fit_app/ui/common/widgets/text/app_large_text.dart';
import 'package:fit_app/ui/common/widgets/text/app_regular_text.dart';
import 'package:fit_app/utils/exercises_hardcoded_data.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  ExercisesHardcodedData exercisesMap = ExercisesHardcodedData();
  @override
  Widget build(BuildContext context) {
    var exercises = exercisesMap.program;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(8),
              height: 140,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(55)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                            text: exercisesMap.program[index]['day'].toString(),
                            size: 20),
                        const SizedBox(height: 10),
                        SizedBox(height: 70, child: _buildMuscleGroup(index)),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget _buildMuscleGroup(int index) {
    var muscles = exercisesMap.program[index]['muscles'];
    return ListView.builder(
        shrinkWrap: true,
        itemCount: muscles.length,
        itemBuilder: (context, index) {
          return Column(children: [
            AppRegularText(
              text: muscles[index],
              size: 18,
              color: Colors.black,
            ),
          ]);
        });
  }
}
