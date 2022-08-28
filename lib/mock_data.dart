class MockData {
  final String ref;
  final DateTime waktu;
  final String statusTransaksi;
  final String sumberDana;
  final String nomorKartu;
  final String cardHolder;
  final double jumlahBayar;
  final double biayaAdministrasi;
  final double totalPembayaran;

  MockData({
    this.ref = "12345678910",
    required this.waktu,
    this.statusTransaksi = "Berhasil",
    this.sumberDana = "xxxxxxxx987",
    this.nomorKartu = "098765432123",
    this.cardHolder = "",
    this.jumlahBayar = 5012876.12,
    this.biayaAdministrasi = 0,
    this.totalPembayaran = 5012876.12,
  });

  Map<String, dynamic> toJson() => {
    "Ref": ref,
    "Waktu": waktu,
    "Status Transaksi": statusTransaksi,
    "Sumber Dana": sumberDana,
    "Nomor Kartu": nomorKartu,
    "Card Holder": cardHolder,
    "Jumlah Bayar": jumlahBayar,
    "Biaya Administrasi": biayaAdministrasi,
    "Total Pembayaran": totalPembayaran,
  };
}