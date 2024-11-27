extension CapitalizeFirstLetter on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension CapitalizeByWord on String {
  String capitalizeByWord() {
    return split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(' ');
  }
}
