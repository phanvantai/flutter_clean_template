import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: FittedBox(
        fit: BoxFit.none,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Card(
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 105, 105, 105),
      ),
    );
  }
}
