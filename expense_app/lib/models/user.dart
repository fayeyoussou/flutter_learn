import 'conn.dart';

class User {
  String? id;
  
  // User({required this.login, required this.password, this.id});
  String get getId {
    return id ?? "";
  }
}
