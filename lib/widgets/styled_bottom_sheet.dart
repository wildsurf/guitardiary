import 'package:flutter/material.dart';

class StyledBottomSheet extends StatelessWidget {
  final Widget child;

  const StyledBottomSheet({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            color: Colors.black45,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      height: MediaQuery.of(context).size.height - 100,
      child: child,
    );
  }
}
