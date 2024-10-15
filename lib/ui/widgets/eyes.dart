import 'package:flutter/material.dart';

class PetWithMovingEyes extends StatefulWidget {
  @override
  _PetWithMovingEyesState createState() => _PetWithMovingEyesState();
}

class _PetWithMovingEyesState extends State<PetWithMovingEyes> {
  Offset touchPosition = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          touchPosition =
              details.localPosition; // Captura la posición del toque
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/PouHappy.png', // imagen de la mascota
            fit: BoxFit.cover,
          ),
          CustomPaint(
            painter: EyesPainter(touchPosition),
            child: Container(), // El canvas donde dibujamos las pupilas
          ),
        ],
      ),
    );
  }
}

class EyesPainter extends CustomPainter {
  final Offset touchPosition;

  EyesPainter(this.touchPosition);

  @override
  void paint(Canvas canvas, Size size) {
    // Tamaño y posición inicial de los ojos
    Offset leftEyePosition = Offset(size.width * 0.44, size.height * 0.30);
    Offset rightEyePosition = Offset(size.width * 0.60, size.height * 0.30);

    double eyeRadius = 15.0; // Radio del ojo
    double pupilRadius = 7.0; // Radio de la pupila

    // Distancia máxima a la que la pupila puede moverse dentro del ojo
    double maxPupilMovement = 6.0;

    // Calcular la dirección de las pupilas hacia el toque
    Offset leftDirection = touchPosition - leftEyePosition;
    Offset rightDirection = touchPosition - rightEyePosition;

    // Obtener la longitud de los vectores
    double leftDistance = leftDirection.distance;
    double rightDistance = rightDirection.distance;

    // Limitar el movimiento de las pupilas
    Offset leftPupilOffset = leftDirection /
        (leftDistance == 0 ? 1 : leftDistance) *
        maxPupilMovement.clamp(0.0, eyeRadius - pupilRadius);
    Offset rightPupilOffset = rightDirection /
        (rightDistance == 0 ? 1 : rightDistance) *
        maxPupilMovement.clamp(0.0, eyeRadius - pupilRadius);

    Paint pupilPaint = Paint()..color = Colors.black;

    // Dibujar pupilas
    canvas.drawCircle(
        leftEyePosition + leftPupilOffset, pupilRadius, pupilPaint);
    canvas.drawCircle(
        rightEyePosition + rightPupilOffset, pupilRadius, pupilPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Siempre repintamos para actualizar la posición de las pupilas
  }
}
