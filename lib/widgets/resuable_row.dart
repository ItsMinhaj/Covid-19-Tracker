import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String title;
  final double value;
  const ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(color: Colors.white70),
                ),
                Text("200", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
