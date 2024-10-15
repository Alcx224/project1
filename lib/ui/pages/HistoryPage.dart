import 'package:flutter/material.dart';
import '../widgets/Calendar.dart';
import '../widgets/DaySimulatorWidget.dart';
import '../widgets/NavBar.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CalendarWidget(),
          ),
          DaySimulatorWidget(),
          BottomNavBar(),
        ],
      ),
      // Mostrar el widget de calendario
    );
  }
}
