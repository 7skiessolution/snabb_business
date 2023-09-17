class TransactionResponse {
  String status;
  List<TransactionData> data;

  TransactionResponse({
    required this.status,
    required this.data,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonDataList = json['data'];
    List<TransactionData> transactionDataList = jsonDataList.map((data) => TransactionData.fromJson(data)).toList();

    return TransactionResponse(
      status: json['status'],
      data: transactionDataList,
    );
  }
}

class TransactionData {
  String name;
  double amount;
  String note;
  String dateTime;
  dynamic files;
  double partialAmount;
  int paymentType;
  String category;
  String currency;

  TransactionData({
    required this.name,
    required this.amount,
    required this.note,
    required this.dateTime,
    required this.files,
    required this.partialAmount,
    required this.paymentType,
    required this.category,
    required this.currency,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      name: json['name'],
      amount: json['amount'].toDouble(),
      note: json['note'],
      dateTime: json['dateTime'],
      files: json['files'],
      partialAmount: json['partialAmount'].toDouble(),
      paymentType: json['paymentType'],
      category: json['category'],
      currency: json['currency'],
    );
  }
}
