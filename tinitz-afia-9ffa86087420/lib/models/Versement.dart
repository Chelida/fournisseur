class Versement {
  final  id;
  final  numero;
  final  montant;
  final  solde;
  final  type;
  final  description;
  final  moyen;
  final  numero_cheque;
  final  numero_telephone;
  final  date_transaction;
  final  created_by;
  final  commande_id;


  Versement._(
      {this.id,
        this.numero,
        this.montant,
        this.solde,
        this.description,
        this.moyen,
        this.numero_cheque,
        this.numero_telephone,
        this.date_transaction,
        this.created_by,
        this.type,
        this.commande_id
      });

  factory Versement.fromJson(Map<String, dynamic> json) {
    return Versement._(
      id: json['id'],
      numero: json['numero'],
      montant: json['montant'],
      solde: json['solde'],
      type: json['type'],
      description: json['description'],
      moyen: json['moyen'],
      numero_cheque: json['numero_cheque'],
      numero_telephone: json['numero_telephone'],
      date_transaction: json['date_transaction'],
      created_by: json['created_by'],
      commande_id: json['commande_id'],
    );
  }
}