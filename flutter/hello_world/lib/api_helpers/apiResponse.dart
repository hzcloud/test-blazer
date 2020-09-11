class ApiResponse {
  final String status;
  final String code;
  final Map<String, dynamic> body;
  final List<dynamic> list;
  final String detail;

  ApiResponse({this.status, this.code, this.body, this.list, this.detail});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {

    var cuerpo = json['object'] is Map<String, dynamic> ? json['object'] : null;
    var lista = json['object'] is List<dynamic> ? json['object'] : null;

    return ApiResponse(
      status: json['status'],
      code: json['code'],
      body: cuerpo,
      list: lista,
      detail: json['message'],
    );

  }
}