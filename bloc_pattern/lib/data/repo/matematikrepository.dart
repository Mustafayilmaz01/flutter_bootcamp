class Matematikrepository {
  int toplamaYap(String alinanSayi1, alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int toplam = sayi2 + sayi1;

    return toplam;
  }

  int carpmaYap(String alinanSayi1, alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int carp = sayi2 * sayi1;

    return carp;
  }
}
