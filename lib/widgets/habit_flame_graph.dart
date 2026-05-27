import 'dart:math';

import 'package:flutter/material.dart';

class HabitFlameGraph extends StatelessWidget {
  HabitFlameGraph({super.key});

  static const _colors = [
    Color(0xFF1A1A1A),
    Color(0xFF2E2E2E),
    Color(0xFF484848),
    Color(0xFF6B6B6B),
    Color(0xFF9A9A9A),
  ];

  static const _labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static const _columns = 16;
  static const _rows = 7;
  static const _gap = 4.0;
  static const _labelWidth = 32.0;

  final _random = Random();

  Color _color() => _colors[_random.nextInt(_colors.length)];

  double _cellSize(double totalWidth) =>
      (totalWidth - _labelWidth - (_columns - 1) * _gap) / _columns;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cell = _cellSize(constraints.maxWidth);
        return Column(
          children: List.generate(_rows, (row) => _buildRow(row, cell)),
        );
      },
    );
  }

  Widget _buildRow(int row, double cellSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: row < _rows - 1 ? _gap : 0),
      child: Row(
        children: [
          _buildLabel(_labels[row], cellSize),
          ...List.generate(_columns, (_) => _buildCell(cellSize)),
        ],
      ),
    );
  }

  Widget _buildLabel(String label, double cellSize) {
    return SizedBox(
      width: _labelWidth,
      height: cellSize,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white38, fontSize: 9),
        ),
      ),
    );
  }

  Widget _buildCell(double cellSize) {
    return Padding(
      padding: const EdgeInsets.only(left: _gap),
      child: Container(
        width: cellSize,
        height: cellSize,
        decoration: BoxDecoration(color: _color(), shape: BoxShape.circle),
      ),
    );
  }
}