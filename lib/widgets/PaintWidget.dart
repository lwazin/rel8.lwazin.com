import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rel8/services/ProviderService.dart';

class PaintWidget extends StatefulWidget {
  Color chosenColor;
  String type;
  PaintWidget({this.chosenColor, this.type});
  @override
  _PaintWidgetState createState() => _PaintWidgetState();
}

class _PaintWidgetState extends State<PaintWidget> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: (widget.type == "accent")
            ? (settings.accent == widget.chosenColor)
                ? 1
                : 0.5
            : (settings.base == widget.chosenColor)
                ? 1
                : 0.5,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (widget.type == "accent") {
                settings.switchAccent(widget.chosenColor);
              } else if (widget.type == "base") {
                settings.switchBase(widget.chosenColor);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: widget.chosenColor,
                ),
                duration: Duration(
                  milliseconds: 200,
                ),
                width: (widget.type == "accent")
                    ? (settings.accent == widget.chosenColor)
                        ? 10
                        : 20
                    : (settings.base == widget.chosenColor)
                        ? 10
                        : 20,
                height: (widget.type == "accent")
                    ? (settings.accent == widget.chosenColor)
                        ? 20
                        : 10
                    : (settings.base == widget.chosenColor)
                        ? 20
                        : 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
