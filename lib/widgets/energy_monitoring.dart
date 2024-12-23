import 'package:flutter/material.dart';
import 'package:smart_home/theme.dart';

class EnergyMonitoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Vertical scrolling
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(), // Header with title and subtitle

                SizedBox(height: 16),

                // Horizontal Scrollable Bar Chart Container
                Container(
                  height: 250, // Set height for the chart
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    child: Row(
                      children: [
                        // Energy Usage Bar Chart
                        Container(
                          width:
                              300, // Set fixed width for the chart to allow scrolling
                          child: CustomPaint(
                            painter: BarChartPainter(_createSampleData()),
                          ),
                        ),
                        SizedBox(width: 16),

                        // Energy Usage Legend
                        _buildLegend(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header widget for title and subtitle
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Energy Consumption',
          style: AppTextStyles.deviceName.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Energy usage in kWh over the week',
          style: AppTextStyles.chartLabel.copyWith(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Sample Data for Energy Consumption over a week
  List<EnergyData> _createSampleData() {
    return [
      EnergyData('Mon', 5),
      EnergyData('Tue', 25),
      EnergyData('Wed', 100),
      EnergyData('Thu', 75),
      EnergyData('Fri', 55),
      EnergyData('Sat', 60),
      EnergyData('Sun', 70),
    ];
  }

  // Legend widget displaying the chart label and its color
  Widget _buildLegend() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLegendItem('Usage (kWh)', Colors.deepPurple),
      ],
    );
  }

  // Custom function to build each legend item
  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.chartLabel.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class EnergyData {
  final String day;
  final int usage;

  EnergyData(this.day, this.usage);
}

class BarChartPainter extends CustomPainter {
  final List<EnergyData> data;

  BarChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 12
      ..style = PaintingStyle.fill;

    final double barWidth = size.height / (data.length * 2);
    final double maxUsage =
        data.map((e) => e.usage).reduce((a, b) => a > b ? a : b).toDouble();

    final gridPaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Grid lines and x-axis labels
    for (int i = 0; i <= 5; i++) {
      final x = size.width * (i / 5);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);

      final textSpan = TextSpan(
        text: '${(maxUsage * i / 5).round()} kWh',
        style: AppTextStyles.chartLabel.copyWith(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      );
      textPainter.text = textSpan;
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(canvas, Offset(x - 30, size.height + 5));
    }

    // Bars for each day's energy usage
    for (int i = 0; i < data.length; i++) {
      final double barHeight = size.height * (data[i].usage / maxUsage);
      final double x = size.width * (i / data.length);
      final double y = size.height - barHeight;

      canvas.drawRect(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        paint,
      );

      final textSpan = TextSpan(
        text: data[i].day,
        style: AppTextStyles.chartLabel.copyWith(
          fontSize: 12,
          color: Colors.grey[700],
        ),
      );

      textPainter.text = textSpan;
      textPainter.layout(minWidth: 0, maxWidth: barWidth * 2);
      textPainter.paint(canvas, Offset(x + barWidth / 2 - 10, size.height + 4));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
