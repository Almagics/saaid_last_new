import 'dart:convert';
import 'package:http/http.dart' as http;

class AiApi{

  final apiKey = '587f4f3a6dmsh4cb1e8a2597352fp18d698jsncf5b55d7271e';
  final  Uri url = Uri.parse('https://chatgpt-42.p.rapidapi.com/conversationgpt4') ;

//test

  Future<Map<String, dynamic>> sendMessage(String? message) async{

    String? msg = message;
    Map<String, dynamic> model ;

    final reponse = await http.post(
        url,
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'chatgpt-42.p.rapidapi.com'
        },
        body:json.encode({

          "messages": [
            {
              "role": 'user',
              "content": msg
            }
          ],
          "system_prompt": '',
          "temperature": 0.9,
          "top_k": 5,
          "top_p": 0.9,
          "max_tokens": 256,
          "web_access": false

        })

    );

    final jsonresponse = json.decode(reponse.body);

     print('Ai Reeeeeeeespone :$jsonresponse');

    model = jsonresponse;


     print('Ai Reeeeeeeespone :$model');

    return model;
  }











}