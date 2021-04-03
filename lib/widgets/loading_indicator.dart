import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingIndicator extends StatelessWidget {
  final String loadingText;

  const LoadingIndicator({Key key, this.loadingText = 'Loading...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/guitar.svg',
            color: Colors.pink.shade100,
            width: MediaQuery.of(context).size.width * .8,
          ),
        ),
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Text(
              this.loadingText,
            ),
          ),
        ),
      ],
    );
  }
}
