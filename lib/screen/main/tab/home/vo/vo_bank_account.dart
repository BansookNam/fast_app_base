import 'vo_bank.dart';

class BankAccount {
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance, {
    this.accountTypeName,
  });
}
