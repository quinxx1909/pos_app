///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///

class productData {
/*
{
  "nama_product": "Adidas A New",
  "merk": "Adidas",
  "warna": "merah",
  "harga": "2000000",
  "gambar": {},
  "store_id": 1,
  "updated_at": "2023-11-02T06:38:29.000000Z",
  "created_at": "2023-11-02T06:38:29.000000Z",
  "id": 35
} 
*/

  String? namaProduct;
  String? merk;
  String? warna;
  int? harga;
  String? stok;
  int? stock;
  String? gambar;
  String? status;
  int? storeId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? size;

  productData({
    this.namaProduct,
    this.merk,
    this.warna,
    this.harga,
    this.stok,
    this.stock,
    this.gambar,
    this.status,
    this.storeId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.size,
  });
  productData.fromJson(Map<String, dynamic> json) {
    namaProduct = json['nama_product']?.toString();
    merk = json['merk']?.toString();
    warna = json['warna']?.toString();
    harga = json['harga'];
    stok = json['stok']?.toString();
    stock = json['stock'];
    gambar = json['gambar']?.toString();
    status = json['status']?.toString();
    storeId = json['store_id']?.toInt();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
    size = json['size']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama_product'] = namaProduct;
    data['merk'] = merk;
    data['warna'] = warna;
    data['harga'] = harga;
    data['stok'] = stok;
    data['stock'] = stock;
    data['gambar'] = gambar;
    data['status'] = status;
    data['store_id'] = storeId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['size'] = size;
    return data;
  }
}

class product {
/*
{
  "success": true,
  "data": [
    {
      "nama_product": "Adidas A New",
      "merk": "Adidas",
      "warna": "merah",
      "harga": "2000000",
      "gambar": {},
      "store_id": 1,
      "updated_at": "2023-11-02T06:38:29.000000Z",
      "created_at": "2023-11-02T06:38:29.000000Z",
      "id": 35
    }
  ],
  "message": "Products retrieved successfully."
} 
*/

  bool? success;
  List<productData?>? data;
  String? message;

  product({
    this.success,
    this.data,
    this.message,
  });
  product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <productData>[];
      v.forEach((v) {
        arr0.add(productData.fromJson(v));
      });
      this.data = arr0;
    }
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    data['message'] = message;
    return data;
  }
}
