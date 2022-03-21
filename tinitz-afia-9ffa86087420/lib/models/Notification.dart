class Notif {
  final  id;
  final  message;
  final  statut;


  Notif._(
      {this.id,
        this.message,
        this.statut,
      });

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif._(
      id: json['id'],
      message: json['message'],
      statut: json['statut'],

    );
  }
}