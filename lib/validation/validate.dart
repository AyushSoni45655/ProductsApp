class FormValidation{
  FormValidation._();
  static String? validateText(String?value,String message){
    if(value == null || value.isEmpty){
      return "Enter $message field";
    }
    return null;
  }
  static String? validateEmail(String? value){
    if(value== null ||value.isEmpty){
      return 'Email is empty';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address';
    }
    return null;
  }
  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'password is required';
    }
    if(value.length < 6){
      return 'password must be greater then 6 digit';
    }
    //  if(value.contains(RegExp(r'[A-Z]'))){
    //   return 'Password must contain one upper case letter';
    // }
    // if(value.contains(RegExp(r'[0-9]'))){
    //   return 'Password must contain atleast one number';
    // }
    return null;
  }
}