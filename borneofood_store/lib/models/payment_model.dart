class Payment {
  Payment({
    this.id,
    this.paymentName,
    this.rekeningName,
    this.noRek,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String paymentName;
  String rekeningName;
  String noRek;
  DateTime createdAt;
  DateTime updatedAt;

  Payment copyWith({
    int id,
    String paymentName,
    String rekeningName,
    String noRek,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Payment(
        id: id ?? this.id,
        paymentName: paymentName ?? this.paymentName,
        rekeningName: rekeningName ?? this.rekeningName,
        noRek: noRek ?? this.noRek,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        paymentName: json["paymentName"],
        rekeningName: json["rekeningName"],
        noRek: json["noRek"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "paymentName": paymentName,
        "rekeningName": rekeningName,
        "noRek": noRek,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
