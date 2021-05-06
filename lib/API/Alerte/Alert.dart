// To parse this JSON data, do
//
//     final alert = alertFromJson(jsonString);

import 'dart:convert';

Alert alertFromJson(String str) => Alert.fromJson(json.decode(str));

String alertToJson(Alert data) => json.encode(data.toJson());

class Alert {
  Alert({
    this.fields,
    this.nbResults,
    this.next,
    this.values,
    this.layerName,
    this.tableHref,
  });

  List<String> fields;
  int nbResults;
  String next;
  List<Value> values;
  String layerName;
  String tableHref;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        fields: List<String>.from(json["fields"].map((x) => x)),
        nbResults: json["nb_results"],
        next: json["next"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        layerName: json["layer_name"],
        tableHref: json["table_href"],
      );

  Map<String, dynamic> toJson() => {
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "nb_results": nbResults,
        "next": next,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "layer_name": layerName,
        "table_href": tableHref,
      };
}

class Value {
  Value({
    this.type,
    this.debut,
    this.ligneCom,
    this.mode,
    this.titre,
    this.ligneCli,
    this.message,
    this.cause,
    this.lastUpdateFme,
    this.fin,
  });

  String type;
  DateTime debut;
  String ligneCom;
  String mode;
  String titre;
  String ligneCli;
  String message;
  String cause;
  DateTime lastUpdateFme;
  DateTime fin;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        type: json["type"],
        debut: DateTime.parse(json["debut"]),
        ligneCom: json["ligne_com"],
        mode: json["mode"],
        titre: json["titre"],
        ligneCli: json["ligne_cli"],
        message: json["message"],
        cause: json["cause"],
        lastUpdateFme: DateTime.parse(json["last_update_fme"]),
        fin: DateTime.parse(json["fin"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "debut": debut.toIso8601String(),
        "ligne_com": ligneCom,
        "mode": mode,
        "titre": titre,
        "ligne_cli": ligneCli,
        "message": message,
        "cause": cause,
        "last_update_fme": lastUpdateFme.toIso8601String(),
        "fin": fin.toIso8601String(),
      };
}
