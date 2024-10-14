import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import '../controllers/TaskCompletedController.dart';
import '../pages/daily_tasks_page.dart';

class CalendarWidget extends StatelessWidget {
  final CompleteTaskController completeTaskController =
      Get.find(); // Obtener el controlador

  @override
  Widget build(BuildContext context) {
    return Obx(() => TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: completeTaskController
              .simulatedDate.value, // Usar la fecha simulada como día focal
          selectedDayPredicate: (day) {
            return isSameDay(
                day,
                completeTaskController
                    .simulatedDate.value); // Comparar con la fecha simulada
          },
          onDaySelected: (selectedDay, focusedDay) {
            completeTaskController.simulatedDate.value =
                selectedDay; // Cambiar el día simulado al día seleccionado
            Get.to(() => DailyTasksPage(
                selectedDay:
                    selectedDay)); // Navegar a la página de tareas del día seleccionado
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              int progress = completeTaskController.getProgressForDate(day);
              Color dayColor = _getColorForProgress(progress);

              return Container(
                decoration: BoxDecoration(
                  color: dayColor,
                  shape: BoxShape.rectangle, // Mantener la forma rectangular
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            selectedBuilder: (context, day, focusedDay) {
              // Personalizar el día seleccionado
              int progress = completeTaskController.getProgressForDate(day);
              Color dayColor = _getColorForProgress(progress);

              return Container(
                decoration: BoxDecoration(
                  color: dayColor.withOpacity(
                      0.8), // Usar un color diferente para el día seleccionado
                  shape:
                      BoxShape.rectangle, // Asegurarse de que sea rectangular
                  border: Border.all(
                      color: Colors.white,
                      width: 2), // Borde blanco para destacar
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            todayBuilder: (context, day, focusedDay) {
              // Personalizar el día actual
              int progress = completeTaskController.getProgressForDate(day);
              Color dayColor = _getColorForProgress(progress);

              return Container(
                decoration: BoxDecoration(
                  color: dayColor, // Usar el color del progreso
                  shape: BoxShape.rectangle, // Mantener la forma rectangular
                  border: Border.all(
                      color: Colors.white,
                      width: 2), // Borde blanco para destacar
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ));
  }

  // Método para definir los colores basados en el progreso
  Color _getColorForProgress(int progress) {
    if (progress < 35) {
      return const Color.fromARGB(255, 243, 117, 108);
    } else if (progress < 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
