class AiModel{


  final String result;
  final bool status;
  final int server_code;


  AiModel( {
    required this.result,
    required this.status,
    required this.server_code




  });


  factory AiModel.fromJson(Map<String, dynamic> map) {
    return AiModel(
        result: map['result'],
        status:map['status'],
        server_code:map['server_code']

    );
  }


}