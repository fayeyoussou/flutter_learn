import 'package:expense_app/models/produit.dart';

class AchatProduit {
  int? id;
  int? idAchat;
  Produit? produit;
  int? quantite;
  int get getQuantite {
    return quantite ?? 0;
  }
}
