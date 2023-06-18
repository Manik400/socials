import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socials/services/signinlinkedin.dart';

class LinkedinPost{
  static const String id = 'linkedinpost_screen';

  LinkedinPost(this.accessToken , this.userId);

  final String accessToken ;
  final String userId ;

  Future<void> createPost(String content , String title , List<XFile>? images) async {

    final url = 'https://api.linkedin.com/v2/ugcPosts';
    final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
    };

    final requestBody = {
      'author' : 'urn:li:person:$userId',
      'lifecycleState': 'PUBLISHED',
      'specificContent': {
        'com.linkedin.ugc.ShareContent': {
          'shareCommentary': {
            'text': content,
          },
          'shareMediaCategory': 'NONE', // Add media attachments if required
          'media': images != null
              ? images
              .map((image) => {
            'media': 'https://example.com/images/${DateTime.now().millisecondsSinceEpoch}',
            'status': 'READY',
            'originalUrl': image.path,
          })
              .toList()
              : [],
        },
      },
      'visibility': {
        'com.linkedin.ugc.MemberNetworkVisibility': 'CONNECTIONS',
      },

    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body:  jsonEncode(requestBody)
      );

      if (response.statusCode == 201) {
        // Post created successfully
        print('Post created');
      } else {
        // Handle error response
        print('Failed to create post. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }


    }catch(e){
      print('Error creating post: $e');
    }

  }
}