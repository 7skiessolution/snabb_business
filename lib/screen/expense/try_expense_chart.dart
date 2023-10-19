import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class ExpenseWidget extends StatelessWidget {
    final List<ExpenseData> expenseData;

  ExpenseWidget(this.expenseData);
  @override
  Widget build(BuildContext context) {
    // Sample expense data (adjust this data as needed)
    // final List<ExpenseData> expenseData = [
    //   ExpenseData(0, '1-2'),
    //   ExpenseData(890, '3-4'),
    //   ExpenseData(0, '5-6'),
    //   ExpenseData(0, '7-8'),
    //   ExpenseData(6777, '9-10'),
    //   ExpenseData(0, '11-12'),
    // ];

    // Calculate the maximum expense value
    final maxExpense =
        expenseData.map((data) => data.amount).reduce((a, b) => a > b ? a : b);

    return Container(
      height: MediaQuery.of(context).size.height * 0.18, // Set the height
      width: MediaQuery.of(context).size.width, // Set the width to full width
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.09,
          bottom: MediaQuery.of(context).size.height * 0.023),
      // Add padding
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            painter: RotatedBarChartPainter(expenseData, maxExpense, constraints),
          );
        },
      ),
    );
  }
}

class RotatedBarChartPainter extends CustomPainter {
  final List<ExpenseData> expenseData;
  final int maxExpense;
  final BoxConstraints constraints;

  RotatedBarChartPainter(this.expenseData, this.maxExpense, this.constraints);

  String formatNumber(double value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(0)}B';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(0)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    } else {
      return value.toString();
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = expensecolor // Set a single color for all bars
      ..style = PaintingStyle.fill;

    if (expenseData.isEmpty) {
      return;
    }

    final barHeight = size.height / (expenseData.length * 2);
    const maxGridLines = 4; // Set the number of grid lines

    final gridInterval = maxExpense / maxGridLines;
     for (var i = 0; i <= maxGridLines; i++) {
      final value = gridInterval * i;
      final xPosition = (i / maxGridLines) * (size.width * 0.8);
      final xLabel = formatNumber(value);
      final textPainter = TextPainter(
        text: TextSpan(
          text: xLabel,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xPosition - textPainter.width / 2, size.height + 10),
      );

      // Draw X-axis grid lines
      final gridPaint = Paint()
        ..color = Colors.grey.withOpacity(0.5)
        ..strokeWidth = 0.5;
      canvas.drawLine(
        Offset(xPosition, 0),
        Offset(xPosition, size.height),
        gridPaint,
      );
    }

    for (var i = 0; i < expenseData.length; i++) {
      final data = expenseData[i];
      final yPosition = (i * 2 + 1) * barHeight;
      final barWidth =  maxExpense==0? 0.0:(data.amount / maxExpense) * (size.width * 0.8);

      final rect = Rect.fromPoints(
        Offset(0, yPosition - barHeight / 2),
        Offset(barWidth, yPosition + barHeight / 2),
      );

      canvas.drawRect(rect, paint);
    }

    // Draw Y-axis labels
    for (var i = 0; i < expenseData.length; i++) {
      final data = expenseData[i];
      final yPosition = (i * 2 + 1) * barHeight;
      final textPainter = TextPainter(
        text: TextSpan(
          text: data.month,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-10 - textPainter.width, yPosition - textPainter.height / 2),
      );
    }

    // Draw X-axis labels and grid lines
   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ExpenseData {
  final int amount;
  final String month;

  ExpenseData(this.amount, this.month);
}
