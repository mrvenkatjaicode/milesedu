// To parse this JSON data, do
//
//     final testimonalsonModel = testimonalsonModelFromJson(jsonString);

import 'dart:convert';

TestimonalsonModel testimonalsonModelFromJson(String str) => TestimonalsonModel.fromJson(json.decode(str));

String testimonalsonModelToJson(TestimonalsonModel data) => json.encode(data.toJson());

class TestimonalsonModel {
    String? message;
    List<Datum>? data;

    TestimonalsonModel({
        this.message,
        this.data,
    });

    factory TestimonalsonModel.fromJson(Map<String, dynamic> json) => TestimonalsonModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    bool? likedByMe;
    String? firstName;
    String? lastName;
    String? description;
    String? imageUrl;
    String? videoUrl;
    dynamic fullVideoUrl;
    int? likes;
    String? createdAt;
    String? updatedAt;
    String? createdBy;
    String? modifiedBy;
    bool? watched;

    Datum({
        this.id,
        this.likedByMe,
        this.firstName,
        this.lastName,
        this.description,
        this.imageUrl,
        this.videoUrl,
        this.fullVideoUrl,
        this.likes,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.modifiedBy,
        this.watched,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        likedByMe: json["liked_by_me"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        description: json["description"],
        imageUrl: json["image_url"],
        videoUrl: json["video_url"],
        fullVideoUrl: json["full_video_url"],
        likes: json["likes"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        watched: json["watched"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "liked_by_me": likedByMe,
        "first_name": firstName,
        "last_name": lastName,
        "description": description,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "full_video_url": fullVideoUrl,
        "likes": likes,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "watched": watched,
    };
}
