import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_web_auth/flutter_web_auth.dart';



class LinkedinSignIn{
  final FlutterAppAuth _appAuth = FlutterAppAuth();


  Future<Map<String,dynamic>?> signInWithLinkedIn() async {
    try {
      const String redirectUrl = 'https://www.linkedin.com/developers/tools/oauth/redirect';
      const String clientId = '77vxqldgssnss7';
      const String clientSecret = 'M5dcJ1ohCFZCOg8C';

      // final AuthorizationTokenResponse? result = await _appAuth.authorizeAndExchangeCode(
      //   AuthorizationTokenRequest(
      //     clientId,
      //     redirectUrl,
      //     serviceConfiguration: const AuthorizationServiceConfiguration(authorizationEndpoint: 'https://www.linkedin.com/oauth/v2/authorization', tokenEndpoint: 'https://www.linkedin.com/oauth/v2/accessToken'),
      //     scopes: <String>['r_liteprofile', 'r_emailaddress', 'w_member_social'],
      //   )
      // );
      // if (result != null && result.authorizationAdditionalParameters != null){
      //   final authorizationCode = result.authorizationAdditionalParameters?['code'];
      //   final TokenResponse? accessTokenResponse = await _appAuth.token(TokenRequest(
      //     clientId,
      //     redirectUrl,
      //     authorizationCode:authorizationCode,
      //     serviceConfiguration: const AuthorizationServiceConfiguration(
      //       authorizationEndpoint: 'https://www.linkedin.com/oauth/v2/authorization',
      //       tokenEndpoint: 'https://www.linkedin.com/oauth/v2/accessToken',
      //     ),
      //   ));
      //
      //   final accessToken = accessTokenResponse!.accessToken;
      //   final expiresIn = accessTokenResponse.tokenAdditionalParameters?['expires_in'];
      //   final userId = await _getLinkedInUserId(accessToken!);
      //
      //   Map<String ,dynamic> LinkData=  {
      //     'accessToken': accessToken,
      //     'expiresIn': expiresIn,
      //     'userId': userId,
      //   };
      //   return LinkData;
      // }
      // return{};


      final authorizationUrl =
          'https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=$clientId&redirect_uri=$redirectUrl&state=STATE&scope=r_liteprofile%20w_member_social'; // Replace YOUR_CLIENT_ID and redirectUri with your values

      final result = await FlutterWebAuth.authenticate(
        url: authorizationUrl,
        callbackUrlScheme: 'https', // Replace with your app's callback scheme
      );

      final uri = Uri.parse(result);
      final authorizationCode = uri.queryParameters['code'];
      final tokenUrl = 'https://www.linkedin.com/oauth/v2/accessToken';
      final response = await http.post(
        Uri.parse(tokenUrl),
        body: {
          'grant_type': 'authorization_code',
          'code': authorizationCode,
          'redirect_uri': redirectUrl,
          'client_id': clientId,
          'client_secret': clientSecret,
        },
      );

      final responseData = json.decode(response.body);
      final accessToken = responseData['access_token'];
      final userId = responseData['id'];

      Map<String ,dynamic> LinkData=  {
            'accessToken': accessToken,
            // 'expiresIn': expiresIn,
            'userId': userId,
          };
      return LinkData;

    }catch(e){
      print(e);
    }
    // return <String, dynamic>{};
  }


  Future<String> _getLinkedInUserId(String accessToken) async {
    final url = 'https://api.linkedin.com/v2/me';

    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final userId = responseData['id'];
        return userId;
      } else {
        // Handle error response
        print('Failed to get LinkedIn User ID. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return '';
      }
    } catch (e) {
      print('Error getting LinkedIn User ID: $e');
      return '';
    }
  }
}