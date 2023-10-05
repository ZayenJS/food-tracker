import 'package:flutter/material.dart';

class TabControllerHandler {
  double _start = 0.0;
  double _end = 0.0;
  final TabController _tabController;
  Function(int? index)? handler;

  TabControllerHandler(this._tabController, {this.handler});

  void handleColorChange() {
    if (handler == null) {
      throw Exception(
          "Handler is required for TabControllerHandler.handleColorChange");
    }

    double animationValue = _tabController.animation!.value;
    int tabControllerIndex = _tabController.index;

    _start = animationValue;
    bool leftToRight = _start > _end;
    double val = animationValue - tabControllerIndex;
    _end = animationValue;

    if (val == 0.0 || val == 1.0) {
      handler!(null);

      return;
    }

    int index = 0;

    if (leftToRight && val >= 0.5) {
      index = tabControllerIndex + 1;
    } else if (leftToRight && val < 0.5) {
      index = tabControllerIndex;
    } else if (!leftToRight && val <= -0.5) {
      index = tabControllerIndex - 1;
    } else if (!leftToRight && val > -0.5) {
      index = tabControllerIndex;
    }

    handler!(index);
  }
}
