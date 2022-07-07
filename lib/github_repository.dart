import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubRepository{
  Future<String> githubAvatar(String username) async{
    final uri = Uri.parse('https://api.github.com/users/$username');
    final response = await http.get(uri);
    if(response.statusCode == 200){
      return jsonDecode(response.body)['avatar_url'];
    } else {
      throw Exception('Failed to load github avatar');
    }
  }
}