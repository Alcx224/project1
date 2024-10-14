import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskCompletedController.dart';

class DaySimulatorWidget extends StatelessWidget {
  final CompleteTaskController completeTaskController =
      Get.find<CompleteTaskController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón para retroceder el día
          ElevatedButton.icon(
            onPressed: completeTaskController.goBackDay,
            icon: Icon(Icons.arrow_back),
            label: Text(''),
          ),
          // Mostrar la fecha simulada
          Obx(() => Text(
                'Fecha Simulada: ${completeTaskController.simulatedDate.value.day}/${completeTaskController.simulatedDate.value.month}/${completeTaskController.simulatedDate.value.year}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          // Botón para avanzar el día
          ElevatedButton.icon(
            onPressed: completeTaskController.advanceDay,
            icon: Icon(Icons.arrow_forward),
            label: Text(''),
          ),
        ],
      ),
    );
  }
}
