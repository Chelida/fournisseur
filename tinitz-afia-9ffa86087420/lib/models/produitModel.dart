// To parse this JSON data, do
//
//     final produit = produitFromJson(jsonString);

import 'dart:convert';

Produit produitFromJson(String str) => Produit.fromJson(json.decode(str));

String produitToJson(Produit data) => json.encode(data.toJson());

class Produit {
    Produit({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool success;
    int statusCode;
    String message;
    Data data;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.produits,
    });

    List<ProduitElement> produits;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        produits: List<ProduitElement>.from(json["produits"].map((x) => ProduitElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "produits": List<dynamic>.from(produits.map((x) => x.toJson())),
    };
}

class ProduitElement {
    ProduitElement({
        this.id,
        this.code,
        this.libelle,
        this.photo,
        this.quantite,
        this.prixUnitaire,
        this.dateExpiration,
        this.prixCarton,
        this.contenance,
        this.status,
        this.stockAlert,
        this.qteGrossiste,
        this.prixGrossiste,
        this.qteSemiGrossiste,
        this.prixSemiGrossiste,
        this.qteDetaillant,
        this.prixDetaillant,
        this.categorieId,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.validateBy,
        this.categorie,
    });

    int id;
    String code;
    String libelle;
    String photo;
    int quantite;
    dynamic prixUnitaire;
    DateTime dateExpiration;
    int prixCarton;
    dynamic contenance;
    int status;
    int stockAlert;
    int qteGrossiste;
    int prixGrossiste;
    int qteSemiGrossiste;
    int prixSemiGrossiste;
    int qteDetaillant;
    int prixDetaillant;
    int categorieId;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String validateBy;
    Categorie categorie;

    factory ProduitElement.fromJson(Map<String, dynamic> json) => ProduitElement(
        id: json["id"],
        code: json["code"],
        libelle: json["libelle"],
        photo: json["photo"],
        quantite: json["quantite"],
        prixUnitaire: json["prix_unitaire"],
        dateExpiration: DateTime.parse(json["date_expiration"]),
        prixCarton: json["prix_carton"],
        contenance: json["contenance"],
        status: json["status"],
        stockAlert: json["stock_alert"],
        qteGrossiste: json["qte_grossiste"],
        prixGrossiste: json["prix_grossiste"],
        qteSemiGrossiste: json["qte_semi_grossiste"],
        prixSemiGrossiste: json["prix_semi_grossiste"],
        qteDetaillant: json["qte_detaillant"],
        prixDetaillant: json["prix_detaillant"],
        categorieId: json["categorie_id"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        validateBy: json["validate_by"],
        categorie: Categorie.fromJson(json["categorie"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "libelle": libelle,
        "photo": photo,
        "quantite": quantite,
        "prix_unitaire": prixUnitaire,
        "date_expiration": "${dateExpiration.year.toString().padLeft(4, '0')}-${dateExpiration.month.toString().padLeft(2, '0')}-${dateExpiration.day.toString().padLeft(2, '0')}",
        "prix_carton": prixCarton,
        "contenance": contenance,
        "status": status,
        "stock_alert": stockAlert,
        "qte_grossiste": qteGrossiste,
        "prix_grossiste": prixGrossiste,
        "qte_semi_grossiste": qteSemiGrossiste,
        "prix_semi_grossiste": prixSemiGrossiste,
        "qte_detaillant": qteDetaillant,
        "prix_detaillant": prixDetaillant,
        "categorie_id": categorieId,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "validate_by": validateBy,
        "categorie": categorie.toJson(),
    };
}

class Categorie {
    Categorie({
        this.id,
        this.libelle,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    String libelle;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        id: json["id"],
        libelle: json["libelle"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
