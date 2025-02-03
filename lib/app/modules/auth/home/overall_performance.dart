import 'package:flutter/material.dart';

class OverallPerformance extends StatelessWidget {
  final List<Map<String, dynamic>> performanceData = [
    {"year": 2015, "value": 10},
    {"year": 2016, "value": 30},
    {"year": 2017, "value": 20},
    {"year": 2018, "value": 50},
    {"year": 2019, "value": 40},
    {"year": 2020, "value": 60},
    {"year": 2023, "value": 55},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16),
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
          Text(
            "Overall Performance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 200, 
            width: width,
            child: CustomPaint(
              painter: PerformanceChartPainter(performanceData),
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> performanceData;

  PerformanceChartPainter(this.performanceData);

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint fillPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    double maxValue = performanceData.map((e) => e["value"]).reduce((a, b) => a > b ? a : b).toDouble();
    double minValue = performanceData.map((e) => e["value"]).reduce((a, b) => a < b ? a : b).toDouble();

    if (maxValue == minValue) {
      maxValue += 1;
    }

    double widthPerYear = size.width / (performanceData.length - 1);

    Path path = Path();
    for (int i = 0; i < performanceData.length; i++) {
      double x = i * widthPerYear;
      double y = size.height - ((performanceData[i]["value"] - minValue) / (maxValue - minValue)) * size.height;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, fillPaint);

    canvas.drawPath(path, linePaint);

    for (int i = 0; i < performanceData.length; i++) {
      double x = i * widthPerYear;
      double y = size.height - ((performanceData[i]["value"] - minValue) / (maxValue - minValue)) * size.height;
      canvas.drawCircle(Offset(x, y), 5, Paint()..color = Colors.blueAccent);
    }

    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < performanceData.length; i++) {
      textPainter.text = TextSpan(
        text: performanceData[i]["year"].toString(),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      double x = i * widthPerYear;
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, size.height - 20));
    }

    textPainter.text = TextSpan(
      text: maxValue.toStringAsFixed(0),
      style: TextStyle(color: Colors.black, fontSize: 12),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(5, 5));

    for (int i = 1; i <= 5; i++) {
      double y = size.height - (i * size.height / 5);
      textPainter.text = TextSpan(
        text: (minValue + (maxValue - minValue) * i / 5).toStringAsFixed(0),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(5, y - textPainter.height / 2));
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; 
  }
}