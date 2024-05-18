import 'dart:convert';

import 'package:http/http.dart' as http;


import 'aiModel.dart';

class AiService {

  final apiKey = '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';
  final  Uri url = Uri.parse('https://api.openai.com/v1/chat/completions') ;



  Future<List<AiModel>> sendMessage(String? message) async{


    final List<AiModel> listmodel = [];

    final reponse = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':'Bearer $apiKey'
        },
        body:json.encode({

          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": message
            },

          ]})

    );

    final jsonresponse = json.decode(reponse.body);

    print('Ai Reeeeeeeespone :$jsonresponse');



    print('Ai Reeeeeeeespone :$listmodel');

    return listmodel;


  }















}