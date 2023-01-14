class WalletInfo {
  String amount;
  bool isBlocked;
  WalletInfo({
    this.amount = '',
    this.isBlocked = false,
  });

  factory WalletInfo.fromJson(json) {
    return WalletInfo(
      amount: json['amount'] ?? '',
      isBlocked: json['isBlocked'] ?? false,
    );
  }
}