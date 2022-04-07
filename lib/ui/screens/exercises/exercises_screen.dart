import 'package:fit_app/ui/common/widgets/text/app_large_text.dart';
import 'package:fit_app/ui/common/widgets/text/app_regular_text.dart';
import 'package:fit_app/utils/exercises_hardcoded_data.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  // final int selectedIndex;
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  int dayIndex = 0;

  List<String> days = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
  ];
  List<String> muscleGroup = [
    'Cuadriceps, Pantorrillas, Abs',
    'Pecho, Triceps, Abs',
    'Espalda, Biceps, Abs',
    'Hombro, Trapecio, Abs',
    'Femoral, Pantorrilla, Gluteos, Abs',
    'Descanso',
    'Descanso'
  ];
  @override
  Widget build(BuildContext context) {
    ExercisesHardcodedData data = ExercisesHardcodedData();
    var day = data.trainingProgram[dayIndex];

    return Column(
      children: [
        _buildDays(),
        _buildExerciseCard(day),
      ],
    );
  }

  Widget _buildDays() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                dayIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: dayIndex == index ? Colors.orange : Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color:
                        dayIndex == index ? Colors.transparent : Colors.orange,
                  )),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: AppRegularText(
                      text: days[index],
                      color: dayIndex == index ? Colors.black : Colors.white70),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildExerciseCard(Map<String, dynamic> day) {
    return Padding(
      padding: const EdgeInsets.all(
        10,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: day['muscles'].length,
        itemBuilder: (context, muscleIndex) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Muscle
                AppLargeText(
                    size: 22,
                    text: day['muscles'][muscleIndex]['muscle'].toString(),
                    color: Colors.white),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:
                          day['muscles'][muscleIndex]['exercises'].length,
                      itemBuilder: (context, exerciseIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),

                          // Image
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    image: AssetImage(day['muscles']
                                            [muscleIndex]['exercises']
                                        [exerciseIndex]['image']),
                                  ),
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                width: 280,

                                // Exercise
                                child: Center(
                                  child: AppRegularText(
                                      text: day['muscles'][muscleIndex]
                                              ['exercises'][exerciseIndex]
                                          ['exercise'],
                                      color: Colors.white,
                                      size: 22),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.orange),
                                  child: AppRegularText(
                                      text:
                                          '${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['sets']} x ${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['reps']} reps',
                                      color: Colors.black,
                                      size: 13),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.orange),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.watch),
                                      const SizedBox(width: 5),
                                      AppRegularText(
                                          text:
                                              '${day['muscles'][muscleIndex]['exercises'][exerciseIndex]['rest']} rest',
                                          color: Colors.black,
                                          size: 13),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
