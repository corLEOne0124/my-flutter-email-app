import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'message.g.dart';

@JsonSerializable()
class Message {
  String subject;
  String body;
  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['body'] = body;

    return data;
  }

  static Future<List<Message>> browse({String status = 'important'}) async {
    final url = status == 'important' ? Uri.https('run.mocky.io', '/v3/7552b477-117c-4add-9f17-1221284fac51') : Uri.https('run.mocky.io', '/v3/4ddc2785-03d9-4773-ab09-4791829c5152');
    final response = await http.get(url);
    
    final content = response.body;
    List collection = json.decode(content);

    List<Message> messages = collection.map((json) => Message.fromJson(json)).toList();

    return messages;
  }
}
