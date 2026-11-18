const String regNo = '152302019';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by MK
  int count = 0;
  String lowerText = text.toLowerCase();
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by MK
  String cleaned = fullName.trim();

  if (cleaned.isEmpty) {
    return '';
  }

  List<String> names = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

void drawTriangle(int height) {
  // by MK
  if (height <= 0) {
    return;
  }

  int row = 1;

  while (row <= height) {
    String symbol = row.isOdd ? '*' : '#';
    String spaces = List.filled(height - row, ' ').join();
    String marks = List.filled(row, symbol).join();

    print('$spaces$marks');
    row++;
  }
}

int momoFee(int amount) {
  // by MK
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

String maskPhone(String phone) {
  // by MK
  if (phone.length != 10) {
    return 'INVALID';
  }

  return '${phone.substring(0, 3)}${List.filled(5, '*').join()}${phone.substring(8)}';
}

void main() {
  // by MK
  print('Reg no: $regNo | D = $d | T = $t');

  print('\nPART B2');
  print('Maombi KAMANZI has ${countVowels('Maombi KAMANZI')} vowels');

  print('\nPART B3');
  print(initials('Maombi KAMANZI'));
  print(initials(' ana uwase '));
  print(initials(' '));

  print('\nPART C5');
  drawTriangle(d + 3);

  print('Height 0:');
  drawTriangle(0);

  print('Height -2:');
  drawTriangle(-2);

  print('\nPART D2');
  int i = 1;
  int totalFees = 0;
  const String phone = '0788426434';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }

  print('Total fees: $totalFees RWF');
}
