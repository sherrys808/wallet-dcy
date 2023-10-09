import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String val) async {
    await storage.write(key: key, value: val);
    
  }

  readSecureData(String key) async {
    String val = await storage.read(key:key) ?? 'No Data Found';
    print('Data is $val');
  }

}