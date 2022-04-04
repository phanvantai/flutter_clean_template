import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import 'loading_widget.dart';

class BackgroundWidget extends StatelessWidget {
  final DecorationImage? image;
  final Widget child;
  final bool? resizeToAvoidBottomInset;
  final bool? loading;
  const BackgroundWidget({
    Key? key,
    this.image,
    required this.child,
    this.resizeToAvoidBottomInset,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DeviceHelper.hideKeyboard(context),
      child: Container(
        decoration: BoxDecoration(image: image),
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          backgroundColor: image == null ? Colors.white : Colors.transparent,
          body: Stack(
            children: [
              SafeArea(child: child),
              Visibility(
                visible: loading ?? false,
                child: const LoadingWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
