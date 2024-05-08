import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supercharged/supercharged.dart';

import 'kategoriDetail.dart';
import 'model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Kategori> kategori = [
    Kategori(
      id: '1',
      iconData: Icons.device_thermostat,
      title: 'Suhu',
      subtitle: '26\u00B0C',
    ),
    Kategori(
      id: '2',
      iconData: Icons.water_drop,
      title: 'Kelembapan',
      subtitle: '74%',
    ),
    Kategori(
      id: '3',
      iconData: Icons.air,
      title: 'Kecepatan Angin',
      subtitle: '30-39',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '326BFF'.toColor(),
        elevation: 5,
        centerTitle: true,
        title: Text(
          'MONITORING BANJIR',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Hayyul Muqarrabin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              color: Colors.grey.shade300,
              width: MediaQuery.of(context).size.width * 0.2,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double containerWidth = constraints.maxWidth;
                      if (containerWidth < 200) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: '326BFF'.toColor(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.home, color: Colors.white, size: 25),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: '326BFF'.toColor(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Dashboard',
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Banjir',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.flood,
                                size: 35,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Bahaya',
                                  style: TextStyle(fontSize: 15),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Ketinggian Air',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.water,
                                size: 35,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '13 Cm',
                                  style: TextStyle(fontSize: 15),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                      spacing: 14,
                      runSpacing: 15,
                      children:
                          kategori.map((e) => KategoriDetail(e)).toList()),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Grafik Ketinggian Air (Cm)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15),
                        AspectRatio(
                          aspectRatio: 10 / 3.4,
                          child: LineChart(
                            LineChartData(
                              maxX: 3,
                              minX: 1,
                              maxY: 9,
                              minY: 1,
                              titlesData: const FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  axisNameWidget: Text('Ketinggian Air'),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 3,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  axisNameWidget: Text('Jam'),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 1,
                                    getTitlesWidget: bottomTitleWidgets,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(1, 1),
                                    FlSpot(1.3, 2),
                                    FlSpot(1.6, 3),
                                    FlSpot(1.9, 2),
                                    FlSpot(2.1, 1),
                                    FlSpot(2.4, 3),
                                    FlSpot(2.7, 2),
                                    FlSpot(3, 6),
                                  ],
                                  isCurved: true,
                                  // color: 'FCB447'.toColor(),
                                  barWidth: 5,
                                  dotData: FlDotData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Text('Jam'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('08:00');
      break;
    case 2:
      text = const Text('10:00');
      break;
    case 3:
      text = const Text('12:00');
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
