import 'package:flutter/material.dart';

class RenameItemWidget extends StatefulWidget {
  final String title; //initial value
  final String? hintText;
  final TextAlign alignment;
  final void Function(String value) onSave;

  const RenameItemWidget({
    required this.title,
    this.hintText,
    this.alignment = TextAlign.left,
    required this.onSave,
    super.key,
  });

  @override
  State<RenameItemWidget> createState() => _RenameItemWidgetState();
}

class _RenameItemWidgetState extends State<RenameItemWidget> {
  late final TextEditingController _controller;
  late final FocusNode _focus;
  late String _title; //edited value (then submitted)

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.title);
    _focus = FocusNode();
    _title = widget.title;

    _focus.addListener(_cancel);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  // @override
  // void didUpdateWidget(covariant RenameItemWidget oldWidget) {
  //   _controller.text = widget.title;
  //   super.didUpdateWidget(oldWidget);
  // }

  void _cancel() {
    if (!_focus.hasFocus && _controller.text != widget.title) {
      setState(() {
        _controller.text = _title;
      });
    }
  }

  void _submit() {
    setState(() {
      _controller.text = _controller.text.trimRight();
      _title = _controller.text; //maybe strip spaces?
    });

    widget.onSave.call(_title);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focus,
      onSubmitted: (_) => _submit(),
      textInputAction: TextInputAction.done,
      textAlign: widget.alignment,
      maxLines: null,
      decoration: InputDecoration.collapsed(hintText: widget.hintText),
    );
  }
}
