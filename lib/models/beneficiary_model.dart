class BeneficiaryModel {
  final String name;
  final String accNumber;

  BeneficiaryModel({required this.name, required this.accNumber});

  String get beneficiaryName => name;
  String get accountNumber => accNumber;
}
