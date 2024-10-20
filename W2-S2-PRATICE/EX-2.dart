 class BankAccount {
  // declera the all variable  private to secure the Bank Account
  final String _accountName ;
  final int _accountID;
  double _balance;

  // Constructor
  BankAccount(this._accountID, this._accountName, this._balance);

  // Getters
  String get accountName => _accountName;
  int get accountID => _accountID;
  double get balance => _balance;

  // Methods
  void curentBalance() =>	
    print('Balance: \$$_balance');

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
  
  void credit(double amount) => _balance += amount;
}

class Bank {
    final String name ;
    List<BankAccount> accounts = []; 
    Bank(this.name);
    // Method to create a new account
    BankAccount createAccount(int accountID, String accountOwner) {
      if (accounts.any((account) => account.accountID == accountID)) {
        throw Exception('Account with ID $accountID already exists!');
      }  //it check the new account created make sure the id is not dumplicate 
      BankAccount newAccount = BankAccount(accountID, accountOwner, 0);
      accounts.add(newAccount);
      return newAccount;
    }// after the check if the ID is Unique it'll create a new Bank Account

}
 
void main() {

   Bank myBank = Bank("CADT Bank");
   BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

   print(ronanAccount.balance); // Balance: $0
   ronanAccount.credit(100);
   print(ronanAccount.balance); // Balance: $100
   ronanAccount.withdraw(50);
   print(ronanAccount.balance); // Balance: $50

   try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

   try {
     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
   } catch (e) {
     print(e); // Output: Account with ID 100 already exists!
   }
}