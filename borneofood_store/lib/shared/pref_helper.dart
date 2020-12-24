part of 'shared.dart';

// Key Constant
const String KEY_PAYLOAD = "key_payload";
const String KEY_PRODUCT_PAYLOAD = "key_product_payload";
const String KEY_BANNER_PAYLOAD = "key_banner_payload";
const String KEY_CATEGORY_PAYLOAD = "key_category_payload";

// Set Value to Shared-Preferences
// void setStringVal(String key, String value) async {
Future<void> setStringVal(String key, String value) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

void setBoolVal(String key, bool value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(key, value);
}

void setIntVal(String key, int value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt(key, value);
}

void setDoubleVal(String key, double value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setDouble(key, value);
}

// Get Value from Shared-Preferences
Future<String> getStringValue(String key) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final String value = preferences.getString(key);
  return value;
}

getBoolValue(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool value = preferences.getBool(key);
  return value;
}

getIntValue(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int value = preferences.getInt(key);
  return value;
}

getDoubleValue(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  double value = preferences.getDouble(key);
  return value;
}