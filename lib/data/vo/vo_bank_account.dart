import 'vo_bank.dart';

class BankAccount {
  final Bank bank;
  final String? accountTypeName;
  final String accountNumber;
  final String accountHolder;
  int balance;

  BankAccount(
    this.bank,
    this.accountNumber,
    this.accountHolder,
    this.balance, {
    this.accountTypeName,
  });
}
