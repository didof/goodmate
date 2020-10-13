extension StringMethods on String {
  String selectStrBefore(String cuttingPoint) {
    return this.substring(0, this.indexOf(cuttingPoint));
  }

  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + this.substring(1);
  }
}
