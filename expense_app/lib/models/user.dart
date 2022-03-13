import 'conn.dart';

class User {
  int? id;
  String? login;
  int? pin;
  double? somme;
  String? prenom;
  String? nom;
  // User({required this.login, required this.password, this.id});
  int get getId {
    return id ?? 0;
  }

  String get getLogin {
    return login ?? '';
  }

  int get getPin {
    return pin ?? 0;
  }

  double get getSomme {
    return somme ?? 0;
  }

  String get getPrenom {
    return prenom ?? "";
  }

  String get getNom {
    return nom ?? "";
  }

  getUser(int id) async {
    var co = Conn();
    var set;
    // ignore: avoid_print
    var res = await co.findUserByid(2).then((value) {
      return value;
      // print(set);
    });
    User u = User();
    // res.forEach((key, value) {
    //   if (key == 'idutilisateur')
    //     this.id = value;
    //   else if (key == 'login')
    //     this.login = value;
    //   else
    //     this.pin = value;
    // });
    // this = u;
    // ignore: unused_local_variable

    // print(res);
    // print(res);
    return u;
  }
}
