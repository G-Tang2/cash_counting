import 'package:app/main.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/provider.dart';

class TakingHorizontalSpinBox extends StatelessWidget {
  final int i;
  final String label;
  final CashType type;

  const TakingHorizontalSpinBox(this.i, this.label, this.type, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SpinBox(
          value: type == CashType.coin
              ? context.watch<TakingModel>().getCoinCount(i)
              : context.watch<TakingModel>().getNoteCount(i),
          decoration: InputDecoration(labelText: label),
          onChanged: (value) => {updateValue(context, value)},
          keyboardType: TextInputType.number,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(10, 4, 10, 4));
  }

  void updateValue(BuildContext context, double value) {
    if (type == CashType.coin) {
      context.read<TakingModel>().setCoinCount(i, value);
    } else {
      context.read<TakingModel>().setNoteCount(i, value);
    }
  }
}
