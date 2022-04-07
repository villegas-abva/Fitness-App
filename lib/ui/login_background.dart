import 'package:fit_app/ui/common/widgets/text/app_large_text.dart';
import 'package:fit_app/ui/common/widgets/text/app_regular_text.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // imagen
      Container(
        width: double.maxFinite,
        height: 505,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              ('assets/images/cesar_fitness.jpeg'),
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.85), BlendMode.dstATop),
          ),
        ),
      ),
      // icono de opciones
      Positioned(
        top: 15,
        left: 10,
        child: InkWell(
          onTap: () {},
          child: Icon(Icons.menu, color: Colors.white, size: 35),
        ),
      ),
      // titulo
      Positioned(
        top: 405,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AppLargeText(text: 'Hola Andrew', color: Colors.white, size: 30),
            SizedBox(
              height: 5,
            ),
            AppRegularText(
                text: 'Metele sin miedo', color: Colors.white, size: 22),
            // Tu programa
          ],
        ),
      ),
    ]);
  }
}
