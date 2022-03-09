import 'conn.dart';

class User {
  int? id;
  String? login;
  int? pin;
  // User({required this.login, required this.password, this.id});
  getUser(int id) async {
    var co = Conn();
    var set;
    // ignore: avoid_print
    var res = await co.find(2).then((value) {
      return value;
      // print(set);
    });
    User u = User();
    res.forEach((key, value) {
      if (key == 'idutilisateur')
        this.id = value;
      else if (key == 'login')
        this.login = value;
      else
        this.pin = value;
    });
    // this = u;
    // ignore: unused_local_variable

    // print(res);
    // print(res);
    return u;
  }
}
