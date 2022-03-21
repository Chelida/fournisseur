class Produit {
  final  id;
  final  code;
  final  libelle;
  final  photo;
  final  status;
  final  stock_alert;
  final  prix_grossiste;
  final  prix_semi_grossiste;
  final  prix_detaillant;
  final  categorie_id;


  Produit._(
      {this.id,
        this.code,
        this.libelle,
        this.photo,
        this.status,
        this.stock_alert,
        this.prix_grossiste,
        this.prix_semi_grossiste,
        this.prix_detaillant,
        this.categorie_id,
      });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit._(
      id: json['id'],
      code: json['code'],
      libelle: json['libelle'],
      photo: json['photo'],
      status: json['status'],
      stock_alert: json['stock_alert'],
      prix_grossiste: json['prix_grossiste'],
      prix_semi_grossiste: json['prix_semi_grossiste'],
      prix_detaillant: json['prix_detaillant'],
      categorie_id: json['categorie_id'],

    );
  }
}