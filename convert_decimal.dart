// Dart 3.4.1 dart
// Created by Zairyl Zafra

class ConvertConstants {
  static const String binary = '';
  static const String octal = '';
  static const String hexDigits = '0123456789ABCDEF';
  static const String hex = '';
}

abstract class Convert {
  void convert();
}

void convertDecimal(Convert decimal) {
  decimal.convert();
}

class Decimal extends Convert {
  int number;
  Decimal({
    required this.number,
  });

  @override
  void convert() {
    // String decimal = number.toRadixString(10);

    print('Decimal: $number');
  }
}

class Binary extends Convert {
  int decimal;
  Binary({
    required this.decimal,
  });

  @override
  void convert() {
    // String binary = decimal.toRadixString(8);

    String binary = ConvertConstants.binary;

    if (decimal == 0) 0;

    while (decimal > 0) {
      int remainder = decimal % 2;
      binary = remainder.toString() + binary;
      decimal = decimal ~/ 2;
    }

    print('Binary: $binary');
  }
}

class Octal extends Convert {
  int decimal;

  Octal({
    required this.decimal,
  });

  @override
  void convert() {
    // String octal = decimal.toRadixString(8);

    String octal = ConvertConstants.octal;
    int quotient = decimal;

    if (decimal == 0) 0;

    while (quotient != 0) {
      int remainder = quotient % 8;
      octal = remainder.toString() + octal;
      quotient ~/= 8;
    }

    print('Octal: $octal');
  }
}

class Hexa extends Convert {
  int decimal;

  Hexa({
    required this.decimal,
  });

  @override
  void convert() {
    // String hexadecimal = decimal.toRadixString(16);

    String hexDigits = ConvertConstants.hexDigits;
    String hex = ConvertConstants.hex;

    int quotient = decimal;

    if (decimal == 0) 0;

    while (quotient != 0) {
      int remainder = quotient % 16;
      hex = hexDigits[remainder] + hex;
      quotient ~/= 16;
    }

    print('Hexadecimal: $hex');
  }
}

void main() {
  final number = 200;

  Decimal decimal = Decimal(number: number);
  convertDecimal(decimal);

  Binary binary = Binary(decimal: number);
  convertDecimal(binary);

  Octal octal = Octal(decimal: number);
  convertDecimal(octal);

  Hexa hexa = Hexa(decimal: number);
  convertDecimal(hexa);
}
