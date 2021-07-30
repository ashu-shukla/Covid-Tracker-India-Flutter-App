/*
*  home_widget_animation1.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/widgets.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> _createScaleProperty(
        AnimationController animationController) =>
    Interpolation<double>(keyframes: [
      Keyframe<double>(fraction: 0, value: 1),
      Keyframe<double>(fraction: 0.00001, value: 0.3),
      Keyframe<double>(fraction: 0.2, value: 1.1),
      Keyframe<double>(fraction: 0.4, value: 0.9),
      Keyframe<double>(fraction: 0.6, value: 1.03),
      Keyframe<double>(fraction: 0.8, value: 0.97),
      Keyframe<double>(fraction: 1, value: 1),
    ]).animate(CurvedAnimation(
      curve: Interval(0, 1, curve: Cubic(0.215, 0.61, 0.355, 1)),
      parent: animationController,
    ));

Animation<double> _createOpacityProperty(
        AnimationController animationController) =>
    Interpolation<double>(keyframes: [
      Keyframe<double>(fraction: 0, value: 1),
      Keyframe<double>(fraction: 0.00001, value: 0),
      Keyframe<double>(fraction: 0.6, value: 1),
      Keyframe<double>(fraction: 1, value: 1),
    ]).animate(CurvedAnimation(
      curve: Interval(0, 1, curve: Cubic(0.215, 0.61, 0.355, 1)),
      parent: animationController,
    ));

class HomeWidgetAnimation1 extends StatelessWidget {
  HomeWidgetAnimation1(
      {Key key, this.child, @required AnimationController animationController})
      : assert(animationController != null),
        this.scale = _createScaleProperty(animationController),
        this.opacity = _createOpacityProperty(animationController),
        super(key: key);

  final Animation<double> scale;
  final Animation<double> opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.scale,
        this.opacity,
      ]),
      child: this.child,
      builder: (context, widget) {
        return Opacity(
          opacity: this.opacity.value,
          child: Transform.scale(
            scale: this.scale.value,
            alignment: Alignment.center,
            child: widget,
          ),
        );
      },
    );
  }
}
