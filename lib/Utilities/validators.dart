// Check if an input is a valid email
String? validateEmail(String value) {
  // Check if the value is a valid phone number using a regular expression
  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

  if (!regex.hasMatch(value)) {
    return 'ادخل بريد إلكتروني صحيح';
  }
  return null;
}

// Check if phone numbers is valid
String? validatePhone(String value) {
  if (value.isEmpty) {
    return 'الرجاء ادخال رقم الجوال';
  }
  // Check if the value is a valid phone number using a regular expression
  RegExp regex = RegExp(r'^(70|77|71|73|78|79)[0-9]{7}$');
  if (!regex.hasMatch(value)) {
    return 'ادخال رقم جوال صحيح';
  }
  return null;
}

//check if the String contain only Text without numbers or special characters
// noEmpty if the field is not required the pass the null/empty check
String? textOnly(String value, bool noEmpty) {
  RegExp regex =
      RegExp(r'^(?:[a-zA-Z\u0620-\u064A\s]*|)[\sa-zA-Z\u0620-\u064A]*$');
  if (value.isEmpty && noEmpty) {
    return "الرجاء ملء الحقل";
  } else if (regex.hasMatch(value)) {
    return null;
  }
  return "أدخل حروفاً فقط";
}

//check if the String contain only numbers
// noEmpty if the field is not required the pass the null/empty check
String? numbersOnly(String value, bool noEmpty) {
  RegExp regex = RegExp(r'^[0-9]*$');
  if (value.isEmpty && noEmpty) {
    return "الرجاء ملء الحقل";
  } else if (regex.hasMatch(value)) {
    return null;
  }
  return "أدخل أرقاماً فقط";
}

//check if the felid is not empty
String? notEmpty(String value) {
  if (value.isEmpty) {
    return "الرجاء ملء الحقل";
  } else {
    return null;
  }
}
