import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample sales data (adjust this data as needed)
    final List<SaleData> salesData = [
      SaleData(500000, 'Jan'),
      SaleData(780000, 'Feb'),
      SaleData(60008090, 'Mar'),
      SaleData(700000, 'Apr'),
      SaleData(50000000, 'Jan'),
      SaleData(7800000, 'Feb'),
      SaleData(600000, 'Mar'),
      SaleData(7000000, 'Apr'),
    ];

    // Calculate the maximum sales value
    final maxSales =
        salesData.map((data) => data.sales).reduce((a, b) => a > b ? a : b);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0), // Remove the border
      ),
      child: CustomPaint(
        size: Size(300, 200),
        painter: LineChartPainter(salesData, maxSales),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<SaleData> salesData;
  final double maxSales;

  LineChartPainter(this.salesData, this.maxSales);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (salesData.isEmpty) {
      return;
    }

    for (var i = 0; i < salesData.length; i++) {
      final data = salesData[i];
      final xPosition = i * size.width / (salesData.length - 1);
      final yPosition = size.height - (data.sales / maxSales) * size.height;

      if (i == 0) {
        path.moveTo(xPosition, yPosition);
      } else {
        path.lineTo(xPosition, yPosition);
      }

      // Draw data points as circles
      final dotPaint = Paint()
        ..color = Colors.red
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(xPosition, yPosition), 5, dotPaint);
    }

    canvas.drawPath(path, paint);

    // Draw X-axis labels
    for (var i = 0; i < salesData.length; i++) {
      final data = salesData[i];
      final xPosition = i * size.width / (salesData.length - 1);
      canvas.drawLine(
        Offset(xPosition, size.height),
        Offset(xPosition, 0),
        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: data.month,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xPosition - textPainter.width / 2, size.height + 10),
      );
    }

    // Draw Y-axis labels and grid lines
    final gridCount = 5; // The number of grid lines
    for (var i = 0; i < gridCount; i++) {
      final yPosition = (1 - (i / (gridCount - 1))) * size.height;
      final yLabel = (maxSales * (i / (gridCount - 1))).toStringAsFixed(0);

      canvas.drawLine(
        Offset(0, yPosition),
        Offset(size.width, yPosition),
        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: yLabel,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-10 - textPainter.width, yPosition - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SaleData {
  final double sales;
  final String month;

  SaleData(this.sales, this.month);
}
