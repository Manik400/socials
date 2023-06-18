// import 'package:http/http.dart' as http;
// import 'package:socials/services/signintwitter.dart';
//
// class TwitterPost{
//
//
//   Future<void> postOnTwitter(String tweet) async {
//     final String? accessToken = await twitterSignIn.signInWithTwitter();
//
//     final apiUrl = Uri.parse('https://api.twitter.com/1.1/statuses/update.json');
//
//     final headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Authorization': 'Bearer $accessToken',
//     };
//
//     final body = {
//     'status': tweet,
//     };
//
//     final response = await http.post(apiUrl, headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//     // Tweet posted successfully
//     } else {
//     // Error posting tweet
//     }
//   }
// }


import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:socials/services/signintwitter.dart';

class TwitterPost{
  TwitterSignIn twitterSignIn = TwitterSignIn();

  Future<void> postOnTwitter(String tweet, List<XFile>? images) async {
    final String? accessToken = await twitterSignIn.signInWithTwitter();

    final apiUrl = Uri.parse('https://api.twitter.com/1.1/statuses/update_with_media.json');

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    final request = http.MultipartRequest('POST', apiUrl)
      ..headers.addAll(headers)
      ..fields['status'] = tweet;

    if(images != null){
      for (int i = 0; i < images.length; i++) {
        final image = await http.MultipartFile.fromPath('media', images[i].path);
        request.files.add(image);
      }
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      // Tweet posted successfully
    } else {
      // Error posting tweet
    }
  }

}
