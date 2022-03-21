class Cart {
  final int id;
  int quantite;
  int montant;
  int total;
  int produit_id;
  int produit_prix_unitaire;
  int produit_prix_carton;
  int prix_grossiste;
  int prix_detaillant;
  int prix_semi_grossiste;
  String  type;
  final  produit_name;
  final  produit_photo;

  Cart._(
      {this.id,
        this.quantite,
        this.montant,
        this.total,
        this.produit_id,
        this.produit_prix_unitaire,
        this.produit_prix_carton,
        this.produit_name,
        this.type,
        this.prix_detaillant,
        this.prix_grossiste,
        this.prix_semi_grossiste,
        this.produit_photo,
      });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart._(
      id: json['id'],
      quantite: json['quantite'],
      montant: json['montant'],
      total: json['total'] ,
      produit_id: json['produit_id'] as int,
      produit_prix_unitaire: json['produit_prix_unitaire'] as int,
      produit_prix_carton: json['produit_prix_carton'] as int,
      prix_grossiste: json['prix_grossiste'] as int,
      prix_semi_grossiste: json['prix_semi_grossiste'] as int,
      prix_detaillant: json['prix_detaillant'] as int,
      type: json['type'],
      produit_name: json['produit_name'] as String,
      produit_photo: json['produit_photo'] as String,
    );
  }
}
