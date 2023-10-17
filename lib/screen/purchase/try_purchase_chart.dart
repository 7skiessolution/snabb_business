import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample purchase data (adjust this data as needed)
    final List<PurchaseData> purchaseData = [
      PurchaseData(200000, 'Jan'),
      PurchaseData(350000, ''),
      PurchaseData(40088090, 'Mar'),
      PurchaseData(500000, 'Apr'),
      PurchaseData(90000000, ''),
      PurchaseData(1800000, ''),
      PurchaseData(600000, 'Jul'),
      PurchaseData(700000, 'Aug'),
      PurchaseData(500000, 'Apr'),
      PurchaseData(9000000, ''),
      PurchaseData(1800000, ''),
      PurchaseData(600000, 'Jul'),
      PurchaseData(700000, 'Aug'),
    ];

    // Calculate the maximum purchase value
    final maxPurchase =
        purchaseData.map((data) => data.amount).reduce((a, b) => a > b ? a : b);

    return Container(
      height: MediaQuery.of(context).size.height * 0.18, // Set the height
      width: MediaQuery.of(context).size.width, // Set the width to full width
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          bottom: MediaQuery.of(context).size.height * 0.02),
      // Add padding
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            painter: BarChartPainter(purchaseData, maxPurchase, constraints),
          );
        },
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<PurchaseData> purchaseData;
  final double maxPurchase;
  final BoxConstraints constraints;

  BarChartPainter(this.purchaseData, this.maxPurchase, this.constraints);

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
      ..style = PaintingStyle.fill;

    if (purchaseData.isEmpty) {
      return;
    }

    final barWidth = size.width / (purchaseData.length * 2);

    const maxGridLines = 4; // Set the number of grid lines

    final gridInterval = maxPurchase / maxGridLines;

    for (var i = 0; i < purchaseData.length; i++) {
      final data = purchaseData[i];
      final xPosition = (i * 2 + 1) * barWidth;
      final barHeight = (data.amount / maxPurchase) * size.height;

      final rect = Rect.fromPoints(
        Offset(xPosition - barWidth / 2, size.height),
        Offset(xPosition + barWidth / 2, size.height - barHeight),
      );

      canvas.drawRect(rect, paint);
    }

    // Draw X-axis labels
    for (var i = 0; i < purchaseData.length; i++) {
      final data = purchaseData[i];
      final xPosition = (i * 2 + 1) * barWidth;
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
        Offset(xPosition - textPainter.width / 2, size.height + 10),
      );
    }

    // Draw Y-axis labels and grid lines
    for (var i = 0; i <= maxGridLines; i++) {
      final value = gridInterval * i;
      final yPosition = (1 - (i / maxGridLines)) * size.height;
      final yLabel = formatNumber(value);
      final textPainter = TextPainter(
        text: TextSpan(
          text: yLabel,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-10 - textPainter.width, yPosition - textPainter.height / 2),
      );

      // Draw Y-axis grid lines
      final gridPaint = Paint()
        ..color = Colors.grey.withOpacity(0.5)
        ..strokeWidth = 0.5;
      canvas.drawLine(
        Offset(0, yPosition),
        Offset(constraints.maxWidth, yPosition),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PurchaseData {
  final double amount;
  final String month;

  PurchaseData(this.amount, this.month);
}
