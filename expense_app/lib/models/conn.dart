// // import 'dart:async';
// import 'dart:async';
// import 'package:expense_app/models/Achat.dart';
// import 'package:expense_app/models/achat_produit.dart';
// import 'package:expense_app/models/my_connection.dart';
// import 'package:expense_app/models/produit.dart';
// import 'package:expense_app/models/user.dart';
// import 'package:mysql_utils/mysql1/mysql1.dart';
// import 'package:mysql_utils/mysql_utils.dart';

// class Conn {
//   MysqlUtils db = MysqlUtils(
//       settings: ConnectionSettings(
//     host: '172.20.10.8',
//     port: 3306,
//     user: 'fayeyoussou',
//     password: 'mamico',
//     db: 'qrcode',
//     useCompression: false,
//     useSSL: false,
//     timeout: const Duration(seconds: 10),
//   ));

//   Future<User> findUserByid(int id) async {
//     final db = MysqlUtils(
//       settings: ConnectionSettings(
//         host: 'remotemysql.com',
//         port: 3306,
//         user: 's1E5FKGp0B',
//         password: 'U2YLck8V8B',
//         db: 's1E5FKGp0B',
//         useCompression: false,
//         useSSL: false,
//         timeout: const Duration(seconds: 10),
//       ),
//       pool: true,
//     );
//     var row = await db.getOne(
//       table: 'utilisateur',
//       fields: '*',
//       where: {'idutilisateur': id},
//     );
//     User u = User();
//     row.forEach((key, value) {
//       if (key == 'idutilisateur')
//         u.id = value;
//       else if (key == 'login')
//         u.login = value;
//       else
//         u.pin = value;
//     });
//     // print(u.login);
//     return u;
//     ////
//     ///
//     //
//     // var res = await db.getAll(
//     //   table: 'user tb1,upload tb2',
//     //   fields: 'tb2.fileSize',
//     //   where: 'tb2.id>0 and tb2.uid=tb1.id',
//     //   debug: true,
//     // );
//     // print(res);
//     //////insert
//     ///
//     // var res = await db.insert(
//     //   table: 'user',
//     //   insertData: {
//     //     'nickname': 'biner',
//     //     'telphone': '+113888888888',
//     //     'createTime': 1620577162252,
//     //     'updateTime': 1620577162252,
//     //   },
//     // );
//     // print(res);
//     // var isAlive = await db.isConnectionAlive();
//     // if (isAlive) {
//     //   print('mysql is isAlive');
//     // }
//     //////getOne
//     ///
//     // var row = await db.getOne(
//     //   table: 'su_user',
//     //   fields: '*',
//     //   where: {'id': 1},
//     // );
//     // print(row);
//     //////getAll

//     // var row2 = await db.getAll(
//     //   table: 'user',
//     //   fields: '*',
//     //   where: {
//     //     // 'email': 'xxx@google.com',
//     //     // 'id': ['between', '1,4'],
//     //     //'id': ['notbetween', '1,4'],
//     //     // 'email2': ['=', 'sss@google.com'],
//     //     // 'news_title': ['like', '%name%'],
//     //     'id': ['>', 1],
//     //     // 'id': ['in', [1,2,3]]
//     //   },
//     //   debug: true,
//     // );
//     // print(row2);
//     //////avg
//     ///
//     // var row = await db.avg(
//     //   table: 'Product',
//     //   fields: 'price',
//     //   where: {
//     //     'id': ['>', 0]
//     //   },
//     //   debug: true,
//     // );
//     // print(row);
//     //////min
//     ///
//     //   var row = await db.min(
//     //     table: 'Product',
//     //     fields: 'price',
//     //     where: {
//     //       'id': ['>', 0]
//     //     },
//     //     debug: true,
//     //   );
//     //   print(row);
//     //////max
//     ///
//     // var row = await db.max(
//     //   table: 'Product',
//     //   fields: 'price',
//     //   where: {
//     //     'id': ['>', 0]
//     //   },
//     //   debug: true,
//     // );
//     // print(row);
//     ////// base sql
//     ///
//     // var row = await db
//     //     .query('SELECT * FROM Product1 as a,Product2 as b WHERE a.id = b.id', []);
//     // print(row);

//     // var row2 = await db.getAll(
//     //   table: 'table',
//     //   fields: '*',
//     //   where: {
//     //     // 'price': ['>', 0],
//     //     // 'id': ['between', 0, 1],
//     //     // 'id': ['notbetween', 0, 2],
//     //     // 'id': [
//     //     //   'in',
//     //     //   [1, 2]
//     //     // ],
//     //   },
//     //   debug: true,
//     // );
//     // print(row2);
//   }

//   Future<MysqlUtils> updatedb(MysqlUtils db) async {
//     try {
//       await db.query('select true', []);
//       return db;
//     } catch (e) {
//       // _db.close();
//       await Future.delayed(Duration(seconds: 2));
//       db = MysqlUtils(
//           settings: ConnectionSettings(
//         host: '172.20.10.8',
//         port: 3306,
//         user: 'fayeyoussou',
//         password: 'mamico',
//         db: 'qrcode',
//         useCompression: false,
//         useSSL: false,
//         timeout: const Duration(seconds: 10),
//       ));
//       await Future.delayed(Duration(seconds: 2));
//       return db;
//     }
//   }

//   CreerUser() async {}
//   Future<User> connect(String username, int pin) async {
//     MysqlUtils db = MysqlUtils(
//         settings: ConnectionSettings(
//       host: '172.20.10.8',
//       port: 3306,
//       user: 'root',
//       password: '',
//       db: 'qrcode',
//       useCompression: false,
//       useSSL: false,
//       timeout: const Duration(seconds: 10),
//     ));
//     var row = await db.getOne(
//       table: 'utilisateur',
//       fields: '*',
//       where: {
//         'login': username,
//       },
//     );
//     User u = User();
//     if (row.length > 0) {
//       row.forEach((key, value) {
//         if (key == 'idutilisateur')
//           u.id = value;
//         else if (key == 'login') {
//           // print(value);
//           u.login = value;
//         } else if (key == 'pin') {
//           u.pin = value;
//         } else if (key == 'compte')
//           u.somme = value;
//         else if (key == 'prenom')
//           u.prenom = value;
//         else if (key == 'nom') u.nom = value;
//       });
//     } else
//       u.login = 'empty';
//     if (u.pin != pin) {
//       u = User();
//     }
//     db.close();

//     // print(u.id);
//     return u;
//   }

//   Future<List<Achat>> getAchat(int? id) async {
//     MysqlUtils db = MysqlUtils(
//         settings: ConnectionSettings(
//       host: '172.20.10.8',
//       port: 3306,
//       user: 'fayeyoussou',
//       password: 'mamico',
//       db: 'qrcode',
//       useCompression: false,
//       useSSL: false,
//       timeout: const Duration(seconds: 10),
//     ));

//     var res = await db
//         .getAll(table: 'achat', fields: '*', where: {'idUtilisateur': id});
//     List<Achat> ach = [];
//     // print('ok --> ${res}');
//     for (var item in res) {
//       Achat a = Achat();
//       a.idAchat = item['idachat'];
//       a.dateAchat = item['date'];
//       a.user = id;
//       a.achat = await getAchatProduit(item['idachat']).then((value) => value);
//       ach.add(a);
//     }

//     // res.forEach((element) async {
//     //   var a = Achat();
//     //   a.dateAchat = element['date'];
//     //   a.idAchat = element['idachat'];
//     //   a.user = id;
//     //   var ap = await db.getAll(
//     //       table: 'achatproduit',
//     //       fields: '*',
//     //       where: {'idAchat': element['idachat']});
//     //   List<AchatProduit> ls = [];
//     //   ap.forEach((element) async {
//     //     var apr = AchatProduit();
//     //     apr.idAchat = id;
//     //     apr.quantite = element['quantite'];
//     //     apr.id = element['idachatproduit'];
//     //     // print("quantite ${element['quantite']}");
//     //     apr.produit = Produit();
//     //     ls.add(apr);
//     //     // await getproduit(element['idProduit']).then((value) => value);
//     //   });
//     //   a.achat = ls;

//     // ach.add(a);
//     // print(element['date']);
//     // });
//     // print('${ach.first.idAchat} out the foreach');
//     return ach;
//   }

//   Future<List<AchatProduit>> getAchatProduit(int? id) async {
//     MysqlUtils db = MysqlUtils(
//         settings: ConnectionSettings(
//       host: '172.20.10.8',
//       port: 3306,
//       user: 'fayeyoussou',
//       password: 'mamico',
//       db: 'qrcode',
//       useCompression: false,
//       useSSL: false,
//       timeout: const Duration(seconds: 10),
//     ));
//     var res = await db
//         .getAll(table: 'achatproduit', fields: '*', where: {'idAchat': id});
//     // res.forEach((element) async {
//     //   var ap = AchatProduit();
//     //   ap.idAchat = id;
//     //   ap.quantite = element['quantite'];
//     //   ap.id = element['idachatproduit'];
//     //   print("quantite ${element['quantite']}");
//     //   ap.produit = Produit();
//     //   // await getproduit(element['idProduit']).then((value) => value);
//     // });
//     List<AchatProduit> ach = [];
//     for (var item in res) {
//       AchatProduit a = AchatProduit();
//       a.id = item['idachatproduit'];
//       a.idAchat = id;
//       a.quantite = item['quantite'];
//       a.produit = await getproduit(item['idProduit']);
//       ach.add(a);
//     }
//     return ach;
//   }

//   Future<Produit> getproduit(String? id) async {
//     Produit p = Produit();
//     MysqlUtils db = MysqlUtils(
//         settings: ConnectionSettings(
//       host: '172.20.10.8',
//       port: 3306,
//       user: 'fayeyoussou',
//       password: 'mamico',
//       db: 'qrcode',
//       useCompression: false,
//       useSSL: false,
//       timeout: const Duration(seconds: 10),
//     ));
//     var res = await db.getOne(
//       table: 'produit',
//       fields: '*',
//       where: {'idproduit': id},
//     );
//     // Produit p = Produit();
//     res.forEach((key, value) {
//       if (key == 'nom')
//         p.nom = value;
//       else if (key == 'prix')
//         p.prix = value;
//       else if (key == 'description')
//         p.description = value;
//       else
//         p.idproduit = id;
//     });

//     return p;
//   }
// }
