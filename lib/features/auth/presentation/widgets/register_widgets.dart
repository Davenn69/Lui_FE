import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/features/auth/presentation/providers/register_providers.dart';

import '../../../../core/utils/validation.dart';

Widget showEmailTextFormField(WidgetRef ref, TextEditingController controller){
  return TextFormField(
    style: TextStyle(
      fontSize: 16
    ),
    controller : controller,
    keyboardType: TextInputType.emailAddress,
    validator : validateEmail,
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'\s'))
    ],
    decoration: InputDecoration(
      hintText: "Enter your email...",
        hintStyle: TextStyle(
            fontSize: 16
        )
    ),
  );
}

Widget showPasswordTextFormField(WidgetRef ref, TextEditingController controller){
  final isVisible = ref.watch(isPasswordVisibleProvider);
  return TextFormField(
    style: TextStyle(
      fontSize: 16
    ),
    controller : controller,
    keyboardType: TextInputType.visiblePassword,
    obscureText: isVisible,
    validator : validatePassword,
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'\s'))
    ],
    decoration: InputDecoration(
      hintText: "Enter your password...",
      hintStyle: TextStyle(
        fontSize: 16
      ),
      suffixIcon: GestureDetector(
        onTap: (){
          ref.read(isPasswordVisibleProvider.notifier).state = !isVisible;
        },
        child: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
      )
    ),
  );
}

Widget showConfirmPasswordTextFormField(WidgetRef ref, TextEditingController controller, String? compareValue){
  final isVisible = ref.watch(isConfirmPasswordVisibleProvider);
  return TextFormField(
    style: TextStyle(
        fontSize: 16
    ),
    controller : controller,
    keyboardType: TextInputType.visiblePassword,
    obscureText: isVisible,
    validator : (value)=>validateConfirmPassword(value, compareValue),
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'\s'))
    ],
    decoration: InputDecoration(
        hintText: "Enter your password...",
        hintStyle: TextStyle(
            fontSize: 16
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            ref.read(isConfirmPasswordVisibleProvider.notifier).state = !isVisible;
          },
          child: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
        )
    ),
  );
}