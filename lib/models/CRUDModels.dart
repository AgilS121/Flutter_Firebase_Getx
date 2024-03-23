class CRUDModels {
  String docId;
  final String judul;

  CRUDModels({
    required this.docId,
    required this.judul,
  });

  factory CRUDModels.fromJson(Map<String, dynamic> json) {
    return CRUDModels(
      docId: json['docId'] ?? '',
      judul: json['judul'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'judul': judul,
    };
  }
}
