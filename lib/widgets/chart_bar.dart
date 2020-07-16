import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double totalPercent;

  const ChartBar(this.label, this.spending, this.totalPercent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(225, 225, 255, 1),
                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                  ),
                  FractionallySizedBox(
                    heightFactor: totalPercent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('\$${spending.toStringAsFixed(0)}'),
              ),
            ),
          ],
        );
      },
    );
  }
}
