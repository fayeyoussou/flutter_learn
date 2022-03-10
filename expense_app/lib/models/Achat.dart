import 'package:expense_app/models/achat_produit.dart';
import 'package:expense_app/models/produit.dart';
import 'package:expense_app/models/user.dart';

class Achat {
  int? idAchat;
  DateTime? dateAchat;
  User? user;
  List<AchatProduit>? achat;
}
