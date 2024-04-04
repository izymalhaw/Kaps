import 'dart:convert';

class AgentEntity {
  String id;
  String bankName;
  String accNumber;
  String errorMessage;

  AgentEntity({
    required this.id,
    required this.bankName,
    required this.accNumber,
    required this.errorMessage,
  });
}
