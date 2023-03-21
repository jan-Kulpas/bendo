import 'package:flutter/material.dart';

const tilePad = EdgeInsets.symmetric(horizontal: 8, vertical: 12);
const tileMargin = EdgeInsets.symmetric(vertical: 2);

class TileBody extends StatelessWidget {
  final Widget? child;
  final double? width;

  const TileBody({
    this.child,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 14 + tilePad.top * 2),
      color: Colors.transparent,
      padding: tilePad,
      width: width,
      child: child,
    );
  }
}

class Tile extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const Tile({
    this.color,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      margin: tileMargin,
      child: TileBody(
        width: double.infinity,
        child: child,
      ),
    );
  }
}

class MultiTile extends StatelessWidget {
  final List<Widget> children;
  final List<int> flex;
  final Color? color;

  const MultiTile({
    required this.flex,
    required this.children,
    this.color,
    super.key,
  });
  // {
  //   if(flex.length != children.length || flex.firstWhere((e) => e < 0, orElse: () => 1) < 0 ) {
  //     throw Exception("invalid flex");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      margin: tileMargin,
      child: Row(
        children: List.generate(
          children.length,
          (index) => flex[index] >= 0
              ? Flexible(
                  fit: FlexFit.tight,
                  flex: flex[index],
                  child: children[index],
                )
              : children[index],
        ),
      ),
    );
  }
}
