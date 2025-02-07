# powerplantapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# Data collection
Sure, let's implement a basic data collection form for electrical engineers. We'll create a form that allows users to input various types of data such as voltage, current, power, and other relevant parameters.

Step 1: Update DataCollectionPage
We'll add a form with text fields for different types of data. We'll also include validation to ensure the data is entered correctly.

Explanation
Form Key: We use a GlobalKey<FormState> to manage the form state.
TextEditingController: We use TextEditingController to retrieve the values entered in the text fields.
Form: We create a Form widget with several TextFormField widgets for voltage, current, power, and frequency.
Validation: Each TextFormField has a validator to ensure the field is not empty.
Submit Button: When the submit button is pressed, the form is validated, and a success message is shown using a SnackBar.

# Data Storage
To store the collected data, we can use a local database like SQLite. Flutter provides a package called sqflite for SQLite database operations. We'll set up the database to store the collected data and retrieve it for analysis and visualization.

Step 1: Add Dependencies
Add the sqflite and path packages to your pubspec.yaml file:

# Visualization
To perform analysis and visualization on the collected data, we can use packages like charts_flutter for creating charts and graphs. We'll create a new page for analysis and visualization, where we can display charts based on the collected data.

The current implementation of the VisualizationChart uses the following logic to plot the data:

X-Axis: Represents the timestamp of the data points.
Y-Axis: Represents the voltage values of the data points.
Explanation of the Current Logic
X-Axis (Timestamp): The x-axis values are derived from the timestamp field of the data points. The DateTime object is converted to milliseconds since epoch to be used as the x-axis value.
Y-Axis (Voltage): The y-axis values are derived from the voltage field of the data points.

```flutter 
List<FlSpot> voltageSpots = data
    .map((e) => FlSpot(
        DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(),
        e['voltage']))
    .toList();
```
DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(): Converts the timestamp to milliseconds since epoch for the x-axis.
e['voltage']: Uses the voltage value for the y-axis.

Customizing the Chart
If you want to change the parameters for the x-axis and y-axis, you can modify the FlSpot creation logic. For example, if you want to plot current on the y-axis instead of voltage, you can update the code as follows:

List<FlSpot> currentSpots = data
    .map((e) => FlSpot(
        DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(),
        e['current']))
    .toList();

Example: Plotting Current vs. Timestamp
Here's how you can update the VisualizationChart to plot current values on the y-axis:

```bash
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'database_helper.dart';

class VisualizationPage extends StatelessWidget {
  const VisualizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualization'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return VisualizationChart(data: snapshot.data!);
          }
        },
      ),
    );
  }
}

class VisualizationChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  VisualizationChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> currentSpots = data
        .map((e) => FlSpot(
            DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(),
            e['current']))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: currentSpots,
              isCurved: true,
              color: Colors.red, // Updated color for current
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  DateTime date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text('${date.month}/${date.day}');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DataPoint {
  final DateTime time;
  final double value;

  DataPoint(this.time, this.value);
}
```


# Anlysis
With the type of data collected (voltage, current, power, and frequency), several types of analysis can be performed. Here are some common analyses that electrical engineers might find useful:

### 1. **Trend Analysis**
   - **Voltage Trends**: Analyze how voltage levels change over time.
   - **Current Trends**: Monitor current variations over a period.
   - **Power Consumption Trends**: Track power usage patterns.
   - **Frequency Stability**: Observe frequency stability and deviations.

### 2. **Statistical Analysis**
   - **Mean, Median, Mode**: Calculate the average, median, and mode of the collected data.
   - **Standard Deviation**: Measure the variability or dispersion of the data.
   - **Min/Max Values**: Identify the minimum and maximum values recorded.

### 3. **Correlation Analysis**
   - **Voltage vs. Current**: Determine the relationship between voltage and current.
   - **Power vs. Time**: Analyze how power consumption changes over time.
   - **Frequency vs. Time**: Study the stability of frequency over time.

### 4. **Anomaly Detection**
   - **Outlier Detection**: Identify unusual spikes or drops in voltage, current, or power.
   - **Threshold Breach**: Detect when values exceed predefined thresholds.

### 5. **Load Analysis**
   - **Peak Load Analysis**: Identify peak load times and values.
   - **Load Distribution**: Analyze how load is distributed over time.

### 6. **Efficiency Analysis**
   - **Power Factor Calculation**: Calculate the power factor to assess efficiency.
   - **Energy Efficiency**: Evaluate the efficiency of energy usage.

### Example: Trend Analysis for Voltage

Here's an example of how you might implement a simple trend analysis for voltage using the collected data:

```dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'database_helper.dart';

class VoltageTrendPage extends StatelessWidget {
  const VoltageTrendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltage Trend Analysis'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return VoltageTrendChart(data: snapshot.data!);
          }
        },
      ),
    );
  }
}

class VoltageTrendChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  VoltageTrendChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> voltageSpots = data
        .map((e) => FlSpot(
            DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(),
            e['voltage']))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: voltageSpots,
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  DateTime date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text('${date.month}/${date.day}');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Summary

- **Trend Analysis**: Monitor changes in voltage, current, power, and frequency over time.
- **Statistical Analysis**: Calculate mean, median, mode, standard deviation, and min/max values.
- **Correlation Analysis**: Determine relationships between different parameters.
- **Anomaly Detection**: Identify outliers and threshold breaches.
- **Load Analysis**: Analyze peak loads and load distribution.
- **Efficiency Analysis**: Calculate power factor and assess energy efficiency.

These analyses can provide valuable insights into the performance and stability of electrical systems, helping engineers make informed decisions and optimizations.


import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'database_helper.dart';

class VoltageTrendPage extends StatelessWidget {
  const VoltageTrendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltage Trend Analysis'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return VoltageTrendChart(data: snapshot.data!);
          }
        },
      ),
    );
  }
}

class VoltageTrendChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  VoltageTrendChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> voltageSpots = data
        .map((e) => FlSpot(
            DateTime.parse(e['timestamp']).millisecondsSinceEpoch.toDouble(),
            e['voltage']))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: voltageSpots,
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  DateTime date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text('${date.month}/${date.day}');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}






To build the APK for testing your Flutter app, you can use the following steps:

Step 1: Ensure Your Flutter Environment is Set Up
Make sure you have the Flutter SDK installed and your environment is set up correctly. You can verify this by running:
flutter doctor
Step 2: Build the APK
Run the following command to build the APK:
flutter build apk
This will generate a debug APK suitable for testing. The APK will be located in the `build/app/outputs/flutter-apk/` directory.

Step 3: Build a Release APK
If you want to build a release APK, you can use the following command:
flutter build apk --release
This command optimizes the APK for performance and size, making it suitable for distribution.

Step 4: Locate the APK
After the build process is complete, you can find the APK in the following directory:

build/app/outputs/flutter-apk/