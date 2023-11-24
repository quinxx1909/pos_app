///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UangMasukModelData {
/*
{
  "id": 10,
  "nominal": 2500000,
  "tanggal_pemasukan": "2023-11-05 00:00:00",
  "store_id": 5,
  "qty": 1,
  "name_customer": "Romo",
  "name_product": "Adidas New Version",
  "note": "penjualan",
  "created_at": "2023-11-17T07:33:27.000000Z",
  "updated_at": "2023-11-17T07:33:27.000000Z"
} 
*/

  int? id;
  int? nominal;
  String? tanggal_pemasukan;
  int? store_id;
  int? qty;
  String? name_customer;
  String? name_product;
  String? note;
  String? created_at;
  String? updated_at;

  UangMasukModelData({
    this.id,
    this.nominal,
    this.tanggal_pemasukan,
    this.store_id,
    this.qty,
    this.name_customer,
    this.name_product,
    this.note,
    this.created_at,
    this.updated_at,
  });
  UangMasukModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    nominal = json['nominal']?.toInt();
    tanggal_pemasukan = json['tanggal_pemasukan']?.toString();
    store_id = json['store_id']?.toInt();
    qty = json['qty']?.toInt();
    name_customer = json['name_customer']?.toString();
    name_product = json['name_product']?.toString();
    note = json['note']?.toString();
    created_at = json['created_at']?.toString();
    updated_at = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nominal'] = nominal;
    data['tanggal_pemasukan'] = tanggal_pemasukan;
    data['store_id'] = store_id;
    data['qty'] = qty;
    data['name_customer'] = name_customer;
    data['name_product'] = name_product;
    data['note'] = note;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}

class UangMasukModel {
/*
{
  "success": true,
  "data": [
    {
      "id": 10,
      "nominal": 2500000,
      "tanggal_pemasukan": "2023-11-05 00:00:00",
      "store_id": 5,
      "qty": 1,
      "name_customer": "Romo",
      "name_product": "Adidas New Version",
      "note": "penjualan",
      "created_at": "2023-11-17T07:33:27.000000Z",
      "updated_at": "2023-11-17T07:33:27.000000Z"
    }
  ],
  "message": "Products retrieved successfully."
} 
*/

  bool? success;
  List<UangMasukModelData?>? data;
  String? message;

  UangMasukModel({
    this.success,
    this.data,
    this.message,
  });
  UangMasukModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <UangMasukModelData>[];
      v.forEach((v) {
        arr0.add(UangMasukModelData.fromJson(v));
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
