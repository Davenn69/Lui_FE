import 'package:lui_fe/cores/bases/base_notifier.dart';

mixin FormValidatorMixin on BaseNotifier {
  final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  final RegExp emailRegex =
      RegExp(r'^[\w-\.]+@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$');
  final RegExp phoneRegex = RegExp(r'^[0-9]+$');
  final RegExp currencyRegex = RegExp(r'^[0-9.]+$');

  String? getValidation({
    required String value,
    required String label,
    required List<Validator> validationList,
    String? confirmValue,
    List<String>? confirmList,
    Function()? setPhoneBorderError,
  }) {
    // Empty validation
    if (value.isEmpty) {
      if (setPhoneBorderError != null) {
        setPhoneBorderError();
      }
      return '$label can\'t be empty';
    }

    // Length / 8 Characters validation
    if (validationList.contains(Validator.length) && value.length < 8) {
      return '$label kurang dari 8 karakter';
    }

    if (validationList.contains(Validator.nikLength) && value.length != 16) {
      return '$label harus 16 digit angka';
    }

    if (validationList.contains(Validator.numericOnly) &&
        !phoneRegex.hasMatch(value)) {
      return '$label can\'t only be filled with numbers';
    }

    if (validationList.contains(Validator.currency) &&
            !currencyRegex.hasMatch(value) ||
        value == '0') {
      if (value == '0') {
        return '$label tidak boleh 0';
      }
      return '$label hanya boleh berisi angka dan titik';
    }

    // Email validation
    if (validationList.contains(Validator.emailFormat) &&
        !emailRegex.hasMatch(value)) {
      return 'Email format is incorrect';
    }

    // Password validation
    if (validationList.contains(Validator.passwordFormat) &&
        !passwordRegex.hasMatch(value)) {
      return 'Password should follow these formats:\n'
          '- At least 8 charactes\n'
          '- At least 1 uppercase letter\n'
          '- At least 1 lowercase letter\n'
          '- At least 1 number';
    }

    // Confirm Password validation
    if (validationList.contains(Validator.confirmPassword) &&
        ((confirmValue ?? '').isEmpty || value != (confirmValue ?? ''))) {
      return 'Password doesn\'t match';
    }
    if (validationList.contains(Validator.confirmPhoneNumber) &&
        ((confirmValue ?? '').isEmpty || value != (confirmValue ?? ''))) {
      return 'Nomor Handphone yang Anda masukkan tidak sesuai';
    }

    // Phone Number validation
    if (validationList.contains(Validator.phoneNumber) && value.length < 6) {
      if (setPhoneBorderError != null) {
        setPhoneBorderError();
      }
      return '$label tidak boleh kurang dari 6 angka';
    }
    if (validationList.contains(Validator.phoneNumber) &&
        !phoneRegex.hasMatch(value)) {
      if (setPhoneBorderError != null) {
        setPhoneBorderError();
      }
      return 'Phone Number format is incorrect';
    }

    if (validationList.contains(Validator.isInList) &&
        !confirmList!.contains(value)) {
      return 'Bank yang dimasukkan tidak ada';
    }

    return null;
  }
}

enum Validator {
  length,
  emailFormat,
  passwordFormat,
  confirmPassword,
  phoneNumber,
  confirmPhoneNumber,
  numericOnly,
  currency,
  nikLength,
  isInList,
}

