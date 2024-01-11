import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'contact.g.dart';

List<Contact> contactFromJson(String str) => List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Contact {
    @JsonKey(name:"name")
    String name;
    @JsonKey(name:"email")
    String email;
    @JsonKey(name:"phone")
    String phone;

    Contact({
        required this.name,
        required this.email,
        required this.phone,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

    Map<String, dynamic> toJson() => _$ContactToJson(this);
}
