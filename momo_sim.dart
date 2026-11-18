// Student: Maombi KAMANZI
// Reg no: 152302019
const String regNo = '152302019';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by Maombi KAMANZI
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  // by MK
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  StringBuffer formatted = StringBuffer();

  int i = 0;
  while (i < digits.length) {
    formatted.write(digits[i]);
    int remaining = digits.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      formatted.write(',');
    }
    i++;
  }

  return '${negative ? '-' : ''}${formatted.toString()} RWF';
}

bool isValidPin(String pin) {
  // by MK
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    int digit = pin.codeUnitAt(i);
    if (digit < 48 || digit > 57) {
      return false;
    }
    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }
  return true;
}

int sendMoney(int balance, int amount) {
  // by MK
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by MK
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime amount must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;
  print(
    'Airtime ${formatRwf(amount)} purchased. New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

void main() {
  // by MK
  print('Reg no: $regNo | D = $d | T = $t');

  print('\nPIN tests');
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('4821$d: ${isValidPin('4821$d')}');

  int balance = 20000 + t * 500;
  print('\nStarting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print('\nExtra tests');
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF
  print(isValidPin('24680')); // Expected: true
  print(isValidPin('99999')); // Expected: false
}
