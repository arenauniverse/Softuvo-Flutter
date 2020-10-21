bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validateMobile(String value) {
  Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = new RegExp(pattern);
  return (regex.hasMatch(value
      .replaceAll(" ", "")
      .replaceAll("(", "")
      .replaceAll(")", "")
      .replaceAll("-", "")));
}