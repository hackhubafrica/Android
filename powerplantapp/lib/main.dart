import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'database_helper.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  // Initialize sqflite for desktop platforms
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(PowerPlantApp());
}

class PowerPlantApp extends StatelessWidget {
  const PowerPlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PowerPlantApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PowerPlantApp'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Data Collection'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataCollectionPage()),
                );
              },
            ),
            ListTile(
              title: Text('View Collected Data'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataViewPage()),
                );
              },
            ),
            ListTile(
              title: Text('Analysis'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalysisPage()),
                );
              },
            ),
            ListTile(
              title: Text('Visualization'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisualizationPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to PowerPlantApp!'),
      ),
    );
  }
}

class DataCollectionPage extends StatefulWidget {
  const DataCollectionPage({super.key});

  @override
  DataCollectionPageState createState() => DataCollectionPageState();
}

class DataCollectionPageState extends State<DataCollectionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _voltageController = TextEditingController();
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _powerController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Collection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _voltageController,
                decoration: InputDecoration(labelText: 'Voltage (V)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter voltage';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _currentController,
                decoration: InputDecoration(labelText: 'Current (A)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter current';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _powerController,
                decoration: InputDecoration(labelText: 'Power (W)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter power';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _frequencyController,
                decoration: InputDecoration(labelText: 'Frequency (Hz)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter frequency';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {
                      'voltage': double.parse(_voltageController.text),
                      'current': double.parse(_currentController.text),
                      'power': double.parse(_powerController.text),
                      'frequency': double.parse(_frequencyController.text),
                    };
                    await DatabaseHelper().insertData(data);
                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data collected successfully')),
                      );
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataViewPage extends StatelessWidget {
  const DataViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collected Data'),
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return ListTile(
                  title: Text('Voltage: ${data['voltage']} V'),
                  subtitle: Text(
                      'Current: ${data['current']} A\nPower: ${data['power']} W\nFrequency: ${data['frequency']} Hz\nTimestamp: ${data['timestamp']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
      ),
      body: Center(
        child: Text('Analysis Page'),
      ),
    );
  }
}

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
              color: Colors.blue, // Updated parameter
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
