import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lui_fe/core/themes/color_theme.dart';

class LoadingIndicator extends StatelessWidget {
    final bool showBackdrop;
    final double? width;
    final double? height;
    final double? indicatorSize;

    LoadingIndicator({
        super.key,
        this.showBackdrop = false,
        this.width,
        this.height,
        this.indicatorSize,
    });

    @override
      Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        color: showBackdrop ? colors.backdrop : null,
        child: Center(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: showBackdrop ? Theme.of(ctx).canvasColor : null,
                ),
                padding: EdgeInsets.all(16),
                width: indicatorSize,
                height: indicatorSize,
                child: CircularProgressIndicator(
                    color: colors.primary,
                    strokeWidth: indicatorSize != null ? (indicatorSize / 8) : 4.w,
                ),
            ),
        ),
    );
}
