// ignore_for_file: constant_identifier_names

const CHECK_CODE_ODD = {
  '0': 1,
  '1': 0,
  '2': 5,
  '3': 7,
  '4': 9,
  '5': 13,
  '6': 15,
  '7': 17,
  '8': 19,
  '9': 21,
  'A': 1,
  'B': 0,
  'C': 5,
  'D': 7,
  'E': 9,
  'F': 13,
  'G': 15,
  'H': 17,
  'I': 19,
  'J': 21,
  'K': 2,
  'L': 4,
  'M': 18,
  'N': 20,
  'O': 11,
  'P': 3,
  'Q': 6,
  'R': 8,
  'S': 12,
  'T': 14,
  'U': 16,
  'V': 10,
  'W': 22,
  'X': 25,
  'Y': 24,
  'Z': 23
};

const CHECK_CODE_EVEN = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  'A': 0,
  'B': 1,
  'C': 2,
  'D': 3,
  'E': 4,
  'F': 5,
  'G': 6,
  'H': 7,
  'I': 8,
  'J': 9,
  'K': 10,
  'L': 11,
  'M': 12,
  'N': 13,
  'O': 14,
  'P': 15,
  'Q': 16,
  'R': 17,
  'S': 18,
  'T': 19,
  'U': 20,
  'V': 21,
  'W': 22,
  'X': 23,
  'Y': 24,
  'Z': 25
};

const CHECK_CODE_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

bool controllaCF(String codiceFiscale) {
    String cf = codiceFiscale.toUpperCase();
    if (cf.length != 16) {
      return false;
    }
    if (!RegExp(r'^[A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1}$')
        .hasMatch(cf)) {
      return false;
    }
    final expectedCheckCode = codiceFiscale[15];
    cf = codiceFiscale.substring(0, 15);
    return _getCheckCode(cf).toUpperCase() == expectedCheckCode.toUpperCase();
  }


  String _getCheckCode(String partialFiscalCode) {
    partialFiscalCode = partialFiscalCode.toUpperCase();
    int val = 0;
    for (int i = 0; i < 15; i = i + 1) {
      final String c = partialFiscalCode[i];
      val += (i % 2 != 0 ? CHECK_CODE_EVEN[c.toString()]! : CHECK_CODE_ODD[c.toString()]!);
    }
    val = val % 26;
    return CHECK_CODE_CHARS[val];
  }