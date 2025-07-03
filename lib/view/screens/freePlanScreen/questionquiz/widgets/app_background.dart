import 'package:flutter/material.dart';
import 'package:zidney/utils/asset_path.dart';

class AppBackground extends StatelessWidget {
  final Widget? child;
  final bool isScrollable;
  final int showBgImage;

  const AppBackground({
    super.key,
    this.child,
    this.isScrollable = false,
    this.showBgImage = 0,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundImage = IgnorePointer(
      child: SizedBox.expand(
        child: Image.asset(
          _getBackgroundAsset(showBgImage),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );

    final foregroundBody = SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final content = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: child ?? const SizedBox.shrink(),
            ),
          );

          return isScrollable
              ? SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: content,
              )
              : content;
        },
      ),
    );

    return Stack(children: [backgroundImage, foregroundBody]);
  }

  String _getBackgroundAsset(int index) {
    switch (index) {
      case 1:
        return AssetPath.appBackgroundPng;
      case 2:
        return AssetPath.appBackgroundtow;
      default:
        return AssetPath.backgroundImage;
    }
  }
}
