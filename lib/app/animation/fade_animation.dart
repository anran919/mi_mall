import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(const Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //       const Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);
    //
    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: Transform.translate(
    //         offset: Offset(0, animation["translateY"]),
    //         child: child
    //     ),
    //   ),
    // );

    // return PlayAnimationBuilder<Color?>(
    //   tween: ColorTween(begin: Colors.blue, end: Colors.orange), // define tween
    //   duration: const Duration(seconds: 5), // define duration
    //   builder: (context, value, widget) {
    //     return Container(
    //       color: value, // use animated color
    //       width: 100,
    //       height: 100,
    //       child: child,
    //     );
    //   },
    // );
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 100, end: 0), // 100.0 to 200.0
      duration: const Duration(milliseconds: 100), // for 1 second
      builder: (context, value, _) {
        return Transform.rotate(
          angle: value,
          // offset: Offset(value,0),
          child: child,
        );
      },
      onCompleted: () {
        // do something ...
      },
    );
  }
}
