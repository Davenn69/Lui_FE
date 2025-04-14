import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_toast.dart';

mixin CustomToastMixin {
  showCustomToast(
    String message, {
    ToastPosition position = ToastPosition.bottom,
    Duration duration = const Duration(seconds: 4),
    bool isError = false,
  }) {
    showToastWidget(
      _AnimatedToast(
        child: CustomToast(
          isError: isError,
          text: message,
        ),
      ),
      dismissOtherToast: true,
      position: position,
      duration: duration,
      handleTouch: true,
    );
  }
}

class _AnimatedToast extends StatefulWidget {
  final Widget child;

  const _AnimatedToast({required this.child});

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0.3), 
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

