class Facture {
  final  id;
  final  reference;
  final  reference_commande;
  final  monantttc;
  final  montantht;
  final  avance;
  final  reste;
  final  statut;
  final  type;
  final  date;


  Facture._(
      {this.id,
        this.reference,
        this.reference_commande,
        this.monantttc,
        this.montantht,
        this.statut,
        this.avance,
        this.reste,
        this.type,
        this.date
      });

  factory Facture.fromJson(Map<String, dynamic> json) {
    return Facture._(
      id: json['id'],
      reference: json['reference'],
      reference_commande: json['reference_commande'],
      montantht: json['montantht'],
      monantttc: json['montantttc'],
      avance: json['avance'],
      reste: json['reste'],
      statut: json['statut'],
      type: json['type'],
      date: json['created_at'],
    );
  }
}