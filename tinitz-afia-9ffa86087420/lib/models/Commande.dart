class Commande {
  final  id;
  final  reference;
  final  date_commande;
  final  date_livraison;
  final  montantht;
  final  montantttc;
  final  avance;
  final  reste;
  final  moyen_paiement;
  final  client_id;
  final  entrepot_id;
  final  facture_id;
  final  created_by;
  final  statut;
  final  etat;


  Commande._(
      {
        this.id,
        this.reference,
        this.date_commande,
        this.date_livraison,
        this.montantht,
        this.montantttc,
        this.avance,
        this.reste,
        this.moyen_paiement,
        this.client_id,
        this.entrepot_id,
        this.facture_id,
        this.created_by,
        this.statut,
        this.etat
      });

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande._(
      id: json['id'],
      reference: json['reference'],
      date_commande: json['date_commande'],
      date_livraison: json['date_livraison'],
      montantht: json['montantht'],
      montantttc: json['montantttc'],
      avance: json['avance'],
      reste: json['reste'],
      moyen_paiement: json['moyen_paiement'],
      client_id: json['client_id'],
      entrepot_id: json['entrepot_id'],
      facture_id: json['facture_id'],
      created_by: json['created_by'],
      statut: json['statut'],
      etat: json['etat'],

    );
  }
}