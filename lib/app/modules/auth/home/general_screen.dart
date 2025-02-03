import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Map<String, String>> birthdays = [
    {"name": "Alice Johnson", "image": "https://via.placeholder.com/50"},
    {"name": "Bob Smith", "image": "https://via.placeholder.com/50"},
  ];

  final List<Map<String, String>> anniversaries = [
    {"name": "David & Emma", "image": "https://via.placeholder.com/50"},
    {"name": "Chris & Sophia", "image": "https://via.placeholder.com/50"},
    {"name": "Liam & Olivia", "image": "https://via.placeholder.com/50"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("General"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            _buildSection("Today’s Birthday", birthdays, Colors.purpleAccent),
            SizedBox(height: 20),
            _buildSection("Anniversary", anniversaries, Colors.orangeAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items, Color color) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          SizedBox(height: 10),
          Column(
            children: items.map((item) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item["image"]!),
                ),
                title: Text(item["name"]!),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: Text("Wish"),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
