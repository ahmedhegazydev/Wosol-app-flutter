class UrlReplacer {
  // Replace 'http://mediapathurl.com' with 'https://beta.etec.gov.sa:2443'
  static String replaceMediaPath(String inputString) {
    const String oldUrl = 'http://mediapathurl.com';
    const String newUrl = 'https://beta.etec.gov.sa:2443';

    if (inputString.isEmpty || inputString.runtimeType != String) {
      print('Invalid input for replaceMediaPath: Expected a non-empty string');
      return inputString;
    }

    return inputString.replaceAll(RegExp(oldUrl), newUrl);
  }

  // Replace 'http://etecportapp01' with 'https://beta.etec.gov.sa:2443'
  static String replaceEtecPortAppPath(String inputString) {
    const String oldUrl = 'http://etecportapp01';
    const String newUrl = 'https://beta.etec.gov.sa:2443';

    if (inputString.isEmpty || inputString.runtimeType != String) {
      print('Invalid input for replaceEtecPortAppPath: Expected a non-empty string');
      return inputString;
    }

    return inputString.replaceAll(RegExp(oldUrl), newUrl);
  }
}
