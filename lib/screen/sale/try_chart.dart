import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample sales data (adjust this data as needed)
    final List<SaleData> salesData = [
      SaleData(500000, 'Jan'),
      SaleData(780000, ''),
      SaleData(60008090, 'Mar'),
      SaleData(700000, 'Apr'),
      SaleData(50000000, ''),
      SaleData(7800000, ''),
      SaleData(600000, 'Mar'),
      SaleData(7000000, 'Apr'),
    ];

    // Calculate the maximum sales value
    final maxSales =
        salesData.map((data) => data.sales).reduce((a, b) => a > b ? a : b);

    return Container(
      height: MediaQuery.of(context).size.height * 0.18, // Set the height
      width: MediaQuery.of(context).size.width, // Set the width to full width
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04,bottom: MediaQuery.of(context).size.height*0.006 ), // Add padding
      child: CustomPaint(
        painter: LineChartPainter(salesData, maxSales),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<SaleData> salesData;
  final double maxSales;

  LineChartPainter(this.salesData, this.maxSales);

  String formatNumber(double value1 ) {
     if (value1 >= 1000000000000000) {
      return '${(value1 / 1000000000000000).toStringAsFixed(0)}Q';
    } else if (value1 >= 10000000000000) {
      return '${(value1 / 10000000000000).toStringAsFixed(0)}T';
    } else if (value1 >= 1000000000) {
      return '${(value1 / 1000000000).toStringAsFixed(0)}B';
    } else if (value1 >= 1000000) {
      return '${(value1 / 1000000).toStringAsFixed(0)}M';
    } else if (value1 >= 1000) {
      return '${(value1 / 1000).toStringAsFixed(0)}K';
    } else if (value1 >= 100) {
      return '${(value1 / 100).toStringAsFixed(0)}H';
    } else if (value1 > 0) {
      return value1.toString();
    } else if (value1 < 0) {
      return '-${convertToKMBa(-value1)}';
    } else {
      return '0';
    }
  }
 String convertToKMBa(num value1) {
    if (value1 >= 1000000000000000) {
      return '${(value1 / 1000000000000000).toStringAsFixed(0)}Q';
    } else if (value1 >= 10000000000000) {
      return '${(value1 / 10000000000000).toStringAsFixed(0)}T';
    } else if (value1 >= 1000000000) {
      return '${(value1 / 1000000000).toStringAsFixed(0)}B';
    } else if (value1 >= 1000000) {
      return '${(value1 / 1000000).toStringAsFixed(0)}M';
    } else if (value1 >= 1000) {
      return '${(value1 / 1000).toStringAsFixed(0)}K';
    } else if (value1 >= 100) {
      return '${(value1 / 100).toStringAsFixed(0)}H';
    } else if (value1 > 0) {
      return value1.toString();
    } else if (value1 < 0) {
      return '-${convertToKMBa(-value1)}';
    } else {
      return '0';
    }
  }
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

    final gridCount = 5; // The number of grid lines
    for (var i = 0; i < gridCount; i++) {
      final yPosition = (1 - (i / (gridCount - 1))) * size.height;
      final yLabel = formatNumber(maxSales * (i / (gridCount - 1)));

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

    // Draw X-axis labels
    for (var i = 0; i < salesData.length; i++) {
      final data = salesData[i];
      final xPosition = i * size.width / (salesData.length - 1);
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

