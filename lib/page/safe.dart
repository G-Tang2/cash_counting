import 'package:app/provider/safe_provider.dart';
import 'package:app/widget/safe_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/src/provider.dart';

class SafePage extends StatefulWidget {
  const SafePage({Key? key}) : super(key: key);

  @override
  _SafePageState createState() => _SafePageState();
}

class _SafePageState extends State<SafePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Safe')),
      body: Scrollbar(
          child: ListView(children: [
        const Text('Enter the number of rolls for each coin denomination.'),
        SafeHorizontalSpinBox(0, '5 cents'),
        SafeHorizontalSpinBox(1, '10 cents'),
        SafeHorizontalSpinBox(2, '20 cents'),
        SafeHorizontalSpinBox(3, '50 cents'),
        SafeHorizontalSpinBox(4, '1 dollar'),
        SafeHorizontalSpinBox(5, '2 dollar'),
        Text(
            'Total: \$${context.watch<SafeModel>().getTotal.toStringAsFixed(2)}'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/till');
            },
            child: const Text('Next'))
      ])));

  //  void handleClick() {
  //    Navigator.pushNamed(context, SafePage.route);
  //  }
}