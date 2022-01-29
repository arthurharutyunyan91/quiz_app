import 'package:flutter/material.dart';
import 'package:quiz_app/model/variant.dart';

class VariantItem extends StatefulWidget {
  final Function(int) onVariantTap;
  final Variant variant;
  final int selectedButtonID;
  final int rightAnswerId;

  VariantItem(
      {@required this.onVariantTap,
      @required this.variant,
      @required this.selectedButtonID,
      @required this.rightAnswerId});

  @override
  _VariantItemState createState() => _VariantItemState();
}

class _VariantItemState extends State<VariantItem> {
  var color;
  var iconData;
  var iconColor;

  @override
  void didUpdateWidget(covariant VariantItem oldWidget) {
    if (widget != oldWidget) {
      updateVariantUI();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onVariantTap(widget.variant.id),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                iconData,
                size: 16,
                color: iconColor,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                '${widget.variant.content}',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateVariantUI() {
    color = Colors.white70;
    iconData = null;
    if (widget.rightAnswerId != -1) {
      if (widget.rightAnswerId == widget.variant.id) {
        color = Color(0xffe0ffe3);
        iconData = Icons.check_circle_outline;
        iconColor = Color(0xff009E9C);
      }
      if (widget.selectedButtonID == widget.variant.id &&
          widget.selectedButtonID != widget.rightAnswerId) {
        iconData = Icons.cancel_outlined;
        color = Color(0xffffeae0);
        iconColor = Color(0xffDC7B40);
      }
    } else if (widget.selectedButtonID == widget.variant.id) {
      color = Color(0xFFFFF6DF);
      iconColor = Colors.amber;
      iconData = Icons.access_time;
    }
  }
}
