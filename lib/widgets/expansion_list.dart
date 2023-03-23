import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class ExpansionList extends StatefulWidget {
  final List<Widget> children;
  final bool expanded;

  const ExpansionList({
    required this.expanded,
    this.children = const <Widget>[],
    super.key,
  });

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);

    if (widget.expanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExpansionList oldWidget) {
    if (oldWidget.expanded != widget.expanded) {
      if (widget.expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: _heightFactor.value,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = widget.expanded && _controller.isDismissed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.children,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildAnimation,
      child: closed ? null : result,
    );
  }
}
