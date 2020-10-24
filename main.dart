import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

/*

@hammerinformation

https://github.com/hammerinformation/flutter-data-visualization/
*/
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, double> _dataMap = {};

  TextEditingController _controller = new TextEditingController(); //for data
  TextEditingController _controller2 = new TextEditingController();

  void addToData(String name, double data) {
    setState(() {
      _dataMap[name] = data;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Expanded(
            flex: 8,
            child: _dataMap.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: PieChart(
                      dataMap: _dataMap,
                      legendOptions: LegendOptions(
                          showLegendsInRow: false, showLegends: true),
                      chartValuesOptions:
                          ChartValuesOptions(showChartValuesInPercentage: true),
                      animationDuration: Duration(seconds: 2),
                    ),
                  ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(24),
                    placeholder: "Data (String)",
                    controller: _controller,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(24),
                    placeholder: "Value (double)",
                    controller: _controller2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CupertinoButton(
                child: Text("Add"),
                color: CupertinoColors.systemIndigo,
                onPressed: () {
                  addToData(_controller.text, double.parse(_controller2.text));
                  _controller.clear();
                  _controller2.clear();
                },
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      )),
    );
  }
}
