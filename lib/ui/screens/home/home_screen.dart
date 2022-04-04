import 'package:fit_app/ui/common/widgets/text/app_large_text.dart';
import 'package:fit_app/ui/common/widgets/text/app_regular_text.dart';
import 'package:fit_app/ui/screens/exercises/exercises_screen.dart';
import 'package:fit_app/utils/exercises_hardcoded_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  int selectedIndex = 0;

  List<Color> colors = [
    Colors.red.shade300,
    Colors.orange.shade600,
    Colors.grey.shade300,
    Colors.yellow.shade700,
    Colors.purple.shade200,
    Colors.grey.shade300,
    Colors.red.shade300,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),

              _buildTitle(),

              _buildDays(),
              // _getExercises(selectedIndex),
              const SizedBox(height: 10),
              WorkoutWidget(index: selectedIndex),
              // WorkoutStateless(index: selectedIndex),

              // Container(height: 800, child: ExercisesScreen()),
              // Wrap(
              //   children: List.generate(
              //     days.length,
              //     (index) {
              //       return _buildDailyWorkout(
              //           day: days[index],
              //           color: colors[index],
              //           muscleGroup: muscleGroup[index]);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AppLargeText(text: 'Hola Andrew', color: Colors.white, size: 24),
        SizedBox(
          height: 5,
        ),
        AppRegularText(
          text: 'Sin miedo',
          color: Colors.white,
        ),
        // Tu programa
        SizedBox(height: 35),

        AppLargeText(
          text: 'Tu programa',
          color: Colors.white,
          size: 19,
        ),
      ],
    );
  }

  Widget _buildDays() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.orange : Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: AppRegularText(
                      text: days[index],
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.white70),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class WorkoutWidget extends StatefulWidget {
  final int index;
  const WorkoutWidget({Key? key, required this.index}) : super(key: key);

  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  ExercisesHardcodedData data = ExercisesHardcodedData();

  @override
  Widget build(BuildContext context) {
    var day = data.program[widget.index];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // loop through global exercises []
          itemCount: day['muscles'].length,
          itemBuilder: (context, ind) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(
                      size: 22,
                      text: day['muscles'][ind]['muscle'].toString(),
                      color: Colors.white),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Wrap(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: day['muscles'][ind]['exercises'].length,
                            itemBuilder: (context, idx) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: AppRegularText(
                                      text: day['muscles'][ind]['exercises']
                                          [idx]['exercise'],
                                      color: Colors.black),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
