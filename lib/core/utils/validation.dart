String? validateEmail(String? value){
  if(value == null || value.isEmpty){
    return "Email cannot be empty";
  }

  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if(!emailRegex.hasMatch(value)){
    return "Enter a valid email address";
  }

  return null;
}

String? validatePassword(String? value){
  if(value == null || value.isEmpty){
    return "Password cannot be null";
  }

  if(value!.length < 8){
    return "Password must be at least 8 characters";
  }

  return null;
}

String? validateConfirmPassword(String? value, String? compareValue){
  if(value == null || value.isEmpty){
    return "Password cannot be null";
  }

  if(value!.length < 8){
    return "Password must be at least 8 characters";
  }

  if(value.toLowerCase() != compareValue?.toLowerCase()){
    return "Password is not the same";
  }

  return null;
}