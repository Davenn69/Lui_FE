import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/features/auth/presentation/providers/register_provider.dart';

import '../../../../core/utils/validation.dart';

 String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter valid email.';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6 || value.length > 20) {
      return 'Password must be 6-20 characters.';
    }
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}:;<>,.?/~`\[\]\\-]).{6,20}$');
  
    if (!regex.hasMatch(value)) {
      return 'Password must contain 1 number and \n1 special character';
    }
    
    return null;
  }

  String? _validateConfirmPassword(String? value, TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

Widget showNameTextFormField(WidgetRef ref, TextEditingController controller){
  return TextFormField(
    style: TextStyle(
      fontSize: 16
    ),
    controller : controller,
    keyboardType: TextInputType.emailAddress,
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'\s'))
    ],
    decoration: InputDecoration(
      hintText: "Enter your name",
        hintStyle: TextStyle(
            fontSize: 16
        )
    ),
  );
}

Widget showEmailTextFormField(WidgetRef ref, TextEditingController controller){
  return TextFormField(
    style: TextStyle(
      fontSize: 16
    ),
    controller : controller,
    keyboardType: TextInputType.emailAddress,
    validator : (value) => _validateEmail(value),
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
    validator : (value) => _validatePassword(value),
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
    validator : (value)=> _validateConfirmPassword(value, controller),
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