class Anggaran {
  int id;
  String nominal;
  String keterangan;

  Anggaran({required this.id, required this.nominal, required this.keterangan});

  // Konversi objek Anggaran menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nominal': nominal,
      'keterangan': keterangan,
    };
  }

  // Konstruksi objek Anggaran dari Map
  factory Anggaran.fromMap(Map<String, dynamic> map) {
    return Anggaran(
      id: map['id'],
      nominal: map['nominal'],
      keterangan: map['keterangan'],
    );
  }
}