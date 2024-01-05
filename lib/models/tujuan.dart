class Tujuan {
  final int? id;
  final String nama;
  final String deskripsi;
  final String nominal;

  Tujuan({
    this.id,
    required this.nama,
    required this.deskripsi,
    required this.nominal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'nominal': nominal,
    };
  }

  factory Tujuan.fromMap(Map<String, dynamic> map) {
    return Tujuan(
      id: map['id'],
      nama: map['nama'],
      deskripsi: map['deskripsi'],
      nominal: map['nominal'],
    );
  }
}
