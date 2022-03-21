class CommandeItems {
  final  id;
  final  montant;
  final  quantite;
  final  total;
  final  type;
  final  produit_photo;
  final  produit_name;

  CommandeItems._(
      {this.id,
        this.montant,
        this.quantite,
        this.total,
        this.type,
        this.produit_photo,
        this.produit_name,
      });

  factory CommandeItems.fromJson(Map<String, dynamic> json) {
    return CommandeItems._(
      id: json['id'],
      montant: json['prix_unitaire'],
      quantite: json['quantite'],
      total: json['montant_total'],
      produit_photo: json['produit_photo'],
      type: json['type'],
      produit_name: json['produit_name'],
    );
  }
}
