class Produit {
  String? idproduit;
  String? nom;
  double? prix;
  String? description;
  String get getIdProduit {
    return idproduit ?? "";
  }
  String get getNom {
    return nom ?? "";
  }
  String get getDescription {
    return description ?? "";
  }
  double get getPrix {
    return prix ?? 0;
  }
}
