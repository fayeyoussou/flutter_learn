import 'package:expense_app/models/achat_produit.dart';
import 'package:expense_app/models/produit.dart';
import 'package:expense_app/models/user.dart';

class Achat {
  int? idAchat;
  DateTime? dateAchat;
  int? user;
  List<AchatProduit>? achat;
  double get prix {
    double prix = 0;
    for (var item in achat!) {
      double prixprod = item.produit?.prix ?? 0;
      int quantites = item?.quantite ?? 0;
      prix += (quantites * prixprod);
    }
    return prix;
  }

  int get getIdAchat {
    return idAchat ?? 0;
  }

  DateTime get getDateAchat {
    return dateAchat ?? DateTime.now();
  }

  int get getUser {
    return user ?? 0;
  }
  List<AchatProduit> get getAchat {
    return achat ?? [];
  }


  String get title {
    String title = '';
    int i = 0;
    for (var item in achat!) {
      String nomprod = item.produit?.nom ?? '';
      if (i > 0) title += ' et ';
      if (i == 2) {
        title += '...';
        break;
      }
      title += '$nomprod';
      i++;
    }
    return title;
  }
}
